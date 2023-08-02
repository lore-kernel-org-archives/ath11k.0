Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12FDC001E0
	for <ath11k@archiver.kernel.org>; Wed,  2 Aug 2023 11:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nblmhnyLS4FgFoykd63JR20KHhAs3hutENfuTWZHaQY=; b=zmRWAj/ybTvxzf
	HxvBcnLVy+63ofWBmztT1BU66RSnR4AjQF6W6oVEEzv6GSI1xa/GN82T01EfuVz3jjA+pbNz4YeVs
	QmyOhTTNID7CyhT+ZDZFvxkcRieFSCuKT05LtxewcThYkOXwppy8WL7lKFjJYrDVNixSb5FelkIjo
	kigbvq1v1eV4Y7A2Q7EbgImNyz89e0iGQmxd4gxWmgRPTApaYt41LRVXOpm8MA+aMEE0r3CCny2X7
	PNX6DCtp2A4tvriQkCm5ilgz/zSPeF0HT2PuWeijM/+KW/y3ccQDkHsy4dVD6/5y8CFDMZfi/vCC8
	uhpOXHro3LGSKbtHbnIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRALz-004q5v-1U;
	Wed, 02 Aug 2023 11:49:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRALv-004q5V-2w
	for ath11k@lists.infradead.org;
	Wed, 02 Aug 2023 11:49:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 438B361938;
	Wed,  2 Aug 2023 11:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75EAC433C8;
	Wed,  2 Aug 2023 11:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690976958;
	bh=vr23ekRDfTSaR0GKV/GudGjbseDbs01M1DzH452Wjcw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ZcBh7BC3o39yFMKbUzh3w1ICm+qDb39E2i51g/3VV3ivx9iva1IbfmT3pjNcxmZAt
	 CXLrkaAX7unRC1+oGydabW3M66HwY7++yNx3tsOjpa6Y9pLjyTEDTYNlgZzt4FO3b6
	 58UpM34afPXWzAzUqITuQQ2rV3mRy1+HXGbQL+R8JDcEvtC8Uz9ptRdM5F/tZm/LPa
	 coZmFx3/+cAs2V06iuoyxJGBEJV/Hei7OZIyihcctsZwO63b1W8+w6aFUbs8vHfX5u
	 2AvQQUbDTMmvrt7CcxtMG+lero9BNk7LUb4OxUtVW35+1eeKGX+s4FUQ+NkBhnDWjU
	 wbl3XQcAuf33w==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix band selection for ppdu received in
 channel
 177 of 5 GHz
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230726044624.20507-1-quic_adisi@quicinc.com>
References: <20230726044624.20507-1-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169097695583.406507.10371419021787807224.kvalo@kernel.org>
Date: Wed,  2 Aug 2023 11:49:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_044920_012688_7117BBC5 
X-CRM114-Status: UNSURE (   9.66  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> 5 GHz band channel 177 support was added with the commit e5e94d10c856 ("wifi:
> ath11k: add channel 177 into 5 GHz channel list"). However, during processing
> for the received ppdu in ath11k_dp_rx_h_ppdu(), channel number is checked only
> till 173. This leads to driver code checking for channel and then fetching the
> band from it which is extra effort since firmware has already given the channel
> number in the metadata.
> 
> Fix this issue by checking the channel number till 177 since we support
> it now.
> 
> Found via code review. Compile tested only.
> 
> Fixes: e5e94d10c856 ("wifi: ath11k: add channel 177 into 5 GHz channel list")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

72c8caf904ae wifi: ath11k: fix band selection for ppdu received in channel 177 of 5 GHz

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230726044624.20507-1-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
