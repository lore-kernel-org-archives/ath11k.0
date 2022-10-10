Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5784C433FE
	for <ath11k@archiver.kernel.org>; Mon, 10 Oct 2022 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGidCrG/IvuWOCQ1W/I2A4yAnqA3YSEDFskXPHwFAHA=; b=djFycqTGiS8sN5
	QW56OMDmOarpB7XySU3wLJhUFHCm7bLLC3U6MEJnMc+4A0NfNs2H7bHEodRifAbOHK0+pLBlQYF/J
	5zKwQ917sASLikpKWRj/Wsw1/9TRI77l8VksWibCCsXzO67QPulY2nzplflfY3uN4heEHhkJhNBmE
	IHxZIadhDhbzKw0F1ploOS2xTwuFRw7CvV9x9LT610MpFanlszYpLIcSZ57KZT3sezN1Zq3wcxiIu
	LotvieMzEKaZuxj1ET7EiGlqadK0BgSFV+fT+gI6N5RBp5mnakw4yaL8Y7SxpKygvaj2QOtsj516X
	dZZnytX6/lSCIkSiYBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohpFj-000Ds6-8f; Mon, 10 Oct 2022 09:39:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohpFg-000DrU-Qk
	for ath11k@lists.infradead.org; Mon, 10 Oct 2022 09:39:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 592C160EC6;
	Mon, 10 Oct 2022 09:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD1EC433D6;
	Mon, 10 Oct 2022 09:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665394751;
	bh=+ntlNPaUu8ZqKEENMV+H9ix1UQJwz1ovCJAvJR+dlzo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=uU2l+K7yp3hFqNw4PUxsf43FpIavUFqgmAJKENNo12SGIJMbYMb6W6teBwZ6L9sMo
	 IIGcEUTsEdyN4aLXcpPdUk4BP960ftwLcA2Cb6tGdDb8EkQqiJy6L7y87AxvTJUG0f
	 NZUrL1l+5uZPs4LdOuq25ClPekjARBzmwulMI+/vcwPJT+e0aIztZoTeIDsgKdqKZo
	 YQEGjaZJJN1VuxnTW7+IRpMipUtF3QX5OGoBfOvMJRK8JqZvYwDqZY6hpk6JXMaAyq
	 pdCrX3+LMKbzuwDIhyAdt+tmET+C7wZcZNYLIM4aKZ8Kkxv3pYGzR8wDBNv6DZbt2e
	 Eypyqiug2EWFQ==
MIME-Version: 1.0
Subject: Re: [PATCH][next] wifi: ath11k: Fix spelling mistake "chnange" ->
 "change"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220928143834.35189-1-colin.i.king@gmail.com>
References: <20220928143834.35189-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166539474757.12656.2793687718974660718.kvalo@kernel.org>
Date: Mon, 10 Oct 2022 09:39:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_023912_936907_0CDC22ED 
X-CRM114-Status: UNSURE (   6.05  )
X-CRM114-Notice: Please train this message.
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

Colin Ian King <colin.i.king@gmail.com> wrote:

> There is a spelling mistake in an ath11k_dbg debug message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a797f479bf3e wifi: ath11k: Fix spelling mistake "chnange" -> "change"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220928143834.35189-1-colin.i.king@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
