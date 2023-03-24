Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1607C6FD1C
	for <ath11k@archiver.kernel.org>; Fri, 24 Mar 2023 15:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxUMeOV9eCqKuiZGshJEq3CHzlFG4cUQgJv3DEGnD8Q=; b=T2xOz5050fslUs
	mzsd4QIBY+v/cZpQuggHaCHgJCr2wq5NQFalH3xeyGr5fdvFhA1y5YbKpLK78d9eUirDad3I60u+2
	z3PUUrKspB0ZD2lsqk5mQ1t/5QCVzlW7AE0N5YR2CV2QnR0pxv/ETXBOKkNQwonafAn3Rdu+f4K7d
	6rHhBzQgFZEdKlrwvCB7pUv5Lf2LRJGsQtwTpkuGXPiCPr6CgmppqPHLhrv1GdLJUA2BtQD9Nk5di
	Komoxb6yRlKmOhUIWENfZIxTpj9Z/sxCdLhCHNaCXon9GUa9m/azkJdWLCTqxm/NcPnVahPHWUkda
	OboSuwD1SjUCGLNH3ORw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfixY-004ko6-0S;
	Fri, 24 Mar 2023 15:04:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfixV-004knK-11
	for ath11k@lists.infradead.org;
	Fri, 24 Mar 2023 15:04:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB02E62B54;
	Fri, 24 Mar 2023 15:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FB3C433D2;
	Fri, 24 Mar 2023 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679670240;
	bh=/I23K0OXPPkwe4qTbG0o7pOV7z8FIYzoQPT2ceT+BVc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SzSJk5z4YzYZ3CE0dj+u5AejCQH0qD1LveYTn7RAmBheVRsZMgo02BK+RG1iqr9Ci
	 SYJwRpEe7HSk3ld0IJJGN0z2YsBrWZXGz2Yt4ipUF4LIdCs07A5JuH8MM7TegsEtka
	 GLYKvVYkS2GwE/FMHlJl2wUVelicV0Ok/AQSvzgRx8PzujvUyFqAsMYaIpLevuafjn
	 HDeX5++1tzlVsqqNtCScYc1ypslorhEAu/LkHc/fsvVBOPfiHmX0IdiPDnSMg9qHhK
	 76p/XZxmgO+oaOec1wCQOl3ttsn+4b/EPFX62FbGTb3p5pHAKdXKqeOZlmS2RAc7+p
	 l6FPX+r5S7NHw==
From: Kalle Valo <kvalo@kernel.org>
To: Ganesh Babu Jothiram <quic_gjothira@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: Configure the FTM responder role using firmware capability flag
References: <20230317072034.8217-1-quic_gjothira@quicinc.com>
Date: Fri, 24 Mar 2023 17:03:56 +0200
In-Reply-To: <20230317072034.8217-1-quic_gjothira@quicinc.com> (Ganesh Babu
	Jothiram's message of "Fri, 17 Mar 2023 12:50:34 +0530")
Message-ID: <87sfduchsz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_080401_412753_9025BD0D 
X-CRM114-Status: GOOD (  10.47  )
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

Ganesh Babu Jothiram <quic_gjothira@quicinc.com> writes:

> Fine Time Measurement(FTM) is offloaded feature to firmware.
> Hence, the configuration of FTM responder role is done using
> firmware capability flag instead of hw param.
>
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Ganesh Babu Jothiram <quic_gjothira@quicinc.com>

[...]

> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -3538,7 +3538,7 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
>  
>  	if (changed & BSS_CHANGED_FTM_RESPONDER &&
>  	    arvif->ftm_responder != info->ftm_responder &&
> -	    ar->ab->hw_params.ftm_responder &&
> +	    (test_bit(WMI_TLV_SERVICE_RTT, ar->ab->wmi_ab.svc_map)) &&

Unnecessary parenthesis, I fixed that in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
