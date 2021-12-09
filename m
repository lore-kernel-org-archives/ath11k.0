Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6C9C433EF
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fD+TvKkAuhmYh3CO89EbaAobOnhG4vYyiRATOWnWtKw=; b=vnkFzhdqhgadK+
	QhGX/ZCFdMvtvOv+iu9PURPTBYHTAJWi6huU3kZr6JMgL12baSbjP6nagVZ8+Y7yoVbx8BE7xKR7X
	fbWlUHoMRz4vYAORBrl79yeyBBccQ09kIkWFjh8yvCpXhzifeAP+vOHBMPEya6z9bJwZ4qDh4wPUR
	djujY3vep0upCFiTWqbMqL/us/IwoZbEoHKyETpBgJOYOMc3ycNLg7Ok9hxddg6VyyP9+0fbp82Py
	lFVWmI3T3YoU91DXYCHBMZmljXhvZ3a4qPG+AH79/46nK2IHx6x1yO/7OnJZL4BO7c9RBWewAxSs7
	8Fn6jQmqHlDWdtWhmrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvLdg-00Gacg-6L; Thu, 09 Dec 2021 15:47:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvLdd-00Gaav-Nv
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 15:47:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA03DB82526;
 Thu,  9 Dec 2021 15:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AC9C341C7;
 Thu,  9 Dec 2021 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639064834;
 bh=YNOFaTpt1tvJv+y9fCTCvs/wMNi4pGUJVNtcNP24z30=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ryzWtrETFjq9LQ3PNVEnbp8XaS5CRAw39D3ZeapzuMta1z31qwWdbVLP6KXMF9e3i
 4LcJftgZflGxEFjIQ3PZaTA/sPeEB0oDMO/TvUEtp0HsmHkmkNzIRHgZ9cIBRnQ15v
 EZ9m/MYxZmLoXvnLuWbtjxdw0WAYPA769HTEhz9tIEML6YPuXSqL01otlbJnvVhHCv
 dE6hZGRs19O5b7w52kfynZUWPHUAGle12i+H5UTH95pU/EqHD3H8WuDWVl2Ui2NNa+
 dsAWt4myfeK49e/xYAtrM8g8Q9LMsaKYJTp6qtCFJHyI6SoNhDL8VSiOTz6rPFOW8h
 T+FUw9+zbFE9A==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 3/6] ath11k: implement hw data filter
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
 <20211011193750.4891-4-cjhuang@codeaurora.org>
Date: Thu, 09 Dec 2021 17:47:10 +0200
In-Reply-To: <20211011193750.4891-4-cjhuang@codeaurora.org> (Carl Huang's
 message of "Mon, 11 Oct 2021 15:37:47 -0400")
Message-ID: <87mtl9zsox.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_074717_960127_7F18B610 
X-CRM114-Status: GOOD (  11.43  )
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

> Host needs to set hw data filter before entering WoW to
> let firmware drop needless bc/mc frames to avoid frequent wakeup.
> Host clears hw data filter when leaving WoW.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>

[...]

> @@ -598,8 +647,14 @@ int ath11k_wow_op_resume(struct ieee80211_hw *hw)
>  	}
>  
>  	ret = ath11k_wow_nlo_cleanup(ar);
> -	if (ret)
> +	if (ret) {
>  		ath11k_warn(ar->ab, "failed to cleanup nlo: %d\n", ret);
> +		goto exit;
> +	}
> +
> +	ret = ath11k_wow_clear_hw_filter(ar);
> +	if (ret)
> +		ath11k_warn(ar->ab, "failed to clear hw filter: %d\n", ret);
>  
>  exit:
>  	if (ret) {

For consistency please add goto exit for ath11k_wow_clear_hw_filter().

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
