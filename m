Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AF8C433FE
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vw0w615rYFKPl+6qkzxuZMnCzk95T1VzWYRRotSRdGs=; b=QojUElHhAmd0cw
	JSLeZCxiKG4nuXv24IZnlkvkOopbIbGZLp2kh+jKyIat3XTLYh03kSHGCmr+l5CvbuouFerhQn/Mg
	teJpVKokj7l2aplTBOvEguVtEmcjtp1RUTbc7MphvhGD7EnegKq2xdiG/8eX5A84lCg1uQVXUcJQW
	65Royl1hRWMHZeeWHjptdjp+7Tw1PTEVyWAsAE++s/+yeI/w8Ak+o7FiGz75fBnPAqes0A9FRHzZE
	mUafUHku8q8YetPEP8vePuXjmMuxw47Mgv1UjFpjuMgK93o9+rBv62GyayF7zKNskatjXY13hloQR
	F4kVwelDXoo9hwC4lPoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvLA7-00GUXK-RW; Thu, 09 Dec 2021 15:16:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvLA4-00GUWj-IS
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 15:16:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4824EB82489;
 Thu,  9 Dec 2021 15:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB83C004DD;
 Thu,  9 Dec 2021 15:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639063002;
 bh=66Cgp3VacMsVX3GfgxZ8ibIa5IwzQamvqK+EV/QKVKg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=bIGEiPZiqi7eUzq/8DllDHRC87cX7v+aUs3PNpbB0DPQyeksPi3yWExMW6BI8lANG
 KoFBSubCGbLZL4qTV3qzadm8uZwL1ylwxH8KslNPj8LCuGgQwJQI2tlIrGuC7e0Ipx
 pEN7x8aSBYls/sWh+63b4ZxiuKN8kGFOj6T2xBYI0BABBFpSj0kKSBSEF+/rGJhBvh
 X6BNNIBiR0DQuZwg1nqZR5yU2pUDWrnP2bamRbK8eUL+yLBKrtE2iSB+/R41/unnRe
 zDaElO4nPrjOFrpZFbLbEXZNlYLTFGBMAHOjEwgirtu9IGoAsxvORBtuSNH/4020sI
 YQc7okdowDhWw==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 5/6] ath11k: support ARP and NS offload
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <20211011193750.4891-6-cjhuang@codeaurora.org>
Date: Thu, 09 Dec 2021 17:16:38 +0200
In-Reply-To: <20211011193750.4891-6-cjhuang@codeaurora.org> (Carl Huang's
 message of "Mon, 11 Oct 2021 15:37:49 -0400")
Message-ID: <87r1alzu3t.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_071644_773916_3CA84C4D 
X-CRM114-Status: GOOD (  12.02  )
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

Carl Huang <cjhuang@codeaurora.org> writes:

> Support ARP and NS offload in WoW state.
>
> Tested this way: put machineA with QCA6390 to WoW state,
> ping/ping6 machineA from another machineB, check sniffer to see
> any ARP response and Neighbour advertisement from machineA.

s/machineA/machine A/
s/machineB/machine B/

> @@ -672,8 +712,15 @@ int ath11k_wow_op_resume(struct ieee80211_hw *hw)
>  	}
>  
>  	ret = ath11k_wow_clear_hw_filter(ar);
> -	if (ret)
> +	if (ret) {
>  		ath11k_warn(ar->ab, "failed to clear hw filter: %d\n", ret);
> +		goto exit;
> +	}
> +
> +	ret = ath11k_wow_protocol_offload(ar, false);
> +	if (ret)
> +		ath11k_warn(ar->ab, "failed to clear wow protocol offload events: %d\n",
> +			    ret);
>  
>  exit:
>  	if (ret) {

For consistency please add goto exit for ath11k_wow_protocol_offload().

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
