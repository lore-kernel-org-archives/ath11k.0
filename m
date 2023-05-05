Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B74EC7EE22
	for <ath11k@archiver.kernel.org>; Fri,  5 May 2023 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DMXdd9G145HEN0IV0GBbuBWz6LVGEOqpheN0pS22yg=; b=rKD7c0skAB7Ysz
	SmpI7fB0zKxMpoKtthypbsYk4of6Zou1Y6U6P0z2HFiTcXJpg28aCagJPYNm5wO8i7aaz6+Z5XoIf
	/gA9Q+uY7BncJ93kchZCa0UUZ/wWnp4DBqm4kbbEu3QflJZtZ78NHB9+Nv1UDBEN1WJmQeLUnXLXN
	mFmDsjcpvyE7RTdYgQZqe39OKGC1/G/jzRLlfY5ZWZgjOVHaQLsBIexVy8VfrvfJoJw9+HkeXfUw0
	otIkpbU2OeoiQ8QruN8Tmwjg/hfKQnYOZHvv/iOm+8k6UE4dZ4kD5hZm0ZFnsqeqCw7GFeUi2d9+O
	e3BYcObaHDXGdpxeUxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puv9D-00Ax2S-0Y;
	Fri, 05 May 2023 13:06:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puv99-00Ax1v-2z
	for ath11k@lists.infradead.org;
	Fri, 05 May 2023 13:06:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 430AA63DF5;
	Fri,  5 May 2023 13:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E1CC4339B;
	Fri,  5 May 2023 13:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683292010;
	bh=pTi9hgjtIKX3NwObZUFs81T3q3enyeNeTCEnzZ4nioM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=P0vlDSVZxfrK8JJ3M0hnyg59yongnYzs1xV61CEaNMRBiPPWaUkw1hdwpv+24URhL
	 CK/e5oHBXIAfaHnuY8K2N77Pue1nupGgyHK0jQLdc7NWwXMl6v2dEgMISDNdAr2MUi
	 np2umZbtSTbDKa/kAUkiqH4DZJhefdeXZUu8zA26D/O5br7dVosDsQW0NB1np8nVDo
	 ZQeV08cV6OvCX1nfQtUBV8P2uaJTrQVkCj57mqhGajX7WRSBciSnUxlw05gZlKOIug
	 3Ts1SAqz7LLeJ22VVMlm/eXv+zXvzio4hQ4VCtfsaEUZ1Jjt0FdeIBgqWQDdy9zhOL
	 pvbBD8UDQ/zzw==
From: Kalle Valo <kvalo@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  linux-kernel@vger.kernel.org,  kernel-janitors@vger.kernel.org,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org
Subject: Re: [PATCH net-next] wifi: ath11k: Use list_count_nodes()
References: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
Date: Fri, 05 May 2023 16:06:46 +0300
In-Reply-To: <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
	(Christophe JAILLET's message of "Wed, 26 Apr 2023 22:48:59 +0200")
Message-ID: <877ctnorkp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_060652_002075_346F3C76 
X-CRM114-Status: GOOD (  14.82  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> ath11k_wmi_fw_stats_num_vdevs() and ath11k_wmi_fw_stats_num_bcn() really
> look the same as list_count_nodes(), so use the latter instead of hand
> writing it.
>
> The first ones use list_for_each_entry() and the other list_for_each(), but
> they both count the number of nodes in the list.
>
> While at it, also remove to prototypes of non-existent functions.
> Based on the names and prototypes, it is likely that they should be
> equivalent to list_count_nodes().
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Un-tested

BTW I prefer to have "Compile tested only" in the commit log to make it
clear that it's not tested on a real device. So I added that sentence to
both this and ath10k patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
