/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   key_compare.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hseong <hseong@student.42seoul.kr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/26 18:40:48 by hseong            #+#    #+#             */
/*   Updated: 2022/05/26 18:42:45 by hseong           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include ""

int	key_compare(void *node1, void *node2)
{
	return (ft_strcmp(node1->key, node2->key));
}
