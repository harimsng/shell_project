/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   dlinkedlist_dup.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hseong <hseong@student.42seoul.kr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/11 17:25:35 by hseong            #+#    #+#             */
/*   Updated: 2022/05/26 21:15:11 by hseong           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include "libft.h"
#include "dlinkedlist.h"

t_dlist	*duplicate_dlist(t_dlist *list, size_t content_size)
{
	t_dlist		*clone;
	size_t		size;
	size_t		idx;

	clone = dlist_init();
	size = list->size;
	idx = 0;
	list->cur = list->head;
	while (idx < size)
	{
		push_back(clone, copy_content(list->cur->content, content_size));
		move_back(list);
		++idx;
	}
	list->cur = NULL;
	return (clone);
}

void	*copy_content(void *input, size_t content_size)
{
	void	*content;

	content = malloc(content_size);
	ft_memcpy(content, input, content_size);
	return (content);
}
