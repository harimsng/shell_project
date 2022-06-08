/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   types.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hseong <hseong@student.42seoul.kr>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/05/04 19:05:47 by hseong            #+#    #+#             */
/*   Updated: 2022/06/08 02:55:08 by hseong           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef TYPE_H
# define TYPE_H

# include <stddef.h>

# ifndef NULL
#  define NULL ((void *)0)
# endif

# define ULLINT unsigned long long int
# define LLINT long long int

typedef ULLINT	t_uint64;
typedef LLINT	t_int64;

#endif
