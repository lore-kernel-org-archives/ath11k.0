Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3289DC7619A
	for <ath11k@archiver.kernel.org>; Wed, 12 Apr 2023 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQ73YDxcD3RK0wYmly/qV0nd7UetmB3GWYYN0+gwKAU=; b=UM8gzTgS217tUj
	asGVtPn4qJZrdb118E6WMB2YQ6kmuFRZEWAuD18gwxCls/0d65YCCDl9OWQGFSyq0TXufuVA61Rqs
	CpTLKy7fOOeCcvLmQ7hDvOiJ8fTfr0nudMQfmfrOMht2Eb6TFr09jdxF+nJ3Rp5MJ6da3iKQEnYnu
	x4fna/Cc9iE7ebrEsEnfXmP3t08nqBowmEsH63IgUUQ3EYO2xvb/Z68rhyi5wpJ+K/Yq7D0TLN98X
	ysGpHLAuTOD8yAUY3Zg59LlV3cCqs05W5Hbl2RtX2/K5KaDg7Vho4ScOqkmqA5/2+oJyzu/iVvEoQ
	g2FMWXtm7fKq/5gLHyzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXIA-002V67-2m;
	Wed, 12 Apr 2023 10:01:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXI7-002V5G-2h
	for ath11k@lists.infradead.org;
	Wed, 12 Apr 2023 10:01:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7069A63288;
	Wed, 12 Apr 2023 10:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221EBC433D2;
	Wed, 12 Apr 2023 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681293687;
	bh=vGpPRHSc8ZffrKJ/mbrxrrpaOdGMrHu7FQNPIsAjjMQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=gLcseSvo2jn2tXYrpc/8R0ZSjPUekxZKfG9Ubm0imOFhr0Z3Dyb1BbJC48pGXSGfK
	 NkndqH6OTHQoi8BPXbq1ko2vk6CO66CKITwSrgMELNQzXIl02YQixDsa5mNkr5xsm4
	 /J7e29El1SnuNHY3pnBXQDzCGk5o1RlgZEUWaEWqMznKIEyS333C1DeMrc/IVOseF+
	 Td3vM9vwD1JjuGyUsNrOt2XbW+4RboHnTkqcqQeWb9jKE1R0KqWXEuV58Rei5EZnWE
	 Q4Qmtyks01Vjt90q+pqB9FCx1d4Advr3wm3zhRpprm9mxp+6QPF+02v7yLo5ohxl5Z
	 4DAZWM6go817g==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Send 11d scan start before
 WMI_START_SCAN_CMDID
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230315161817.29627-1-quic_mpubbise@quicinc.com>
References: <20230315161817.29627-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168129368423.14673.5586980853495473147.kvalo@kernel.org>
Date: Wed, 12 Apr 2023 10:01:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_030127_911025_64ACB973 
X-CRM114-Status: UNSURE (   9.10  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Firmwares advertising the support of triggering 11d algorithm on the
> scan results of a regular scan expects driver to send
> WMI_11D_SCAN_START_CMDID before sending WMI_START_SCAN_CMDID.
> Triggering 11d algorithm on the scan results of a normal scan helps
> in completely avoiding a separate 11d scan for determining regdomain.
> This indirectly helps in speeding up connections on station
> interfaces on the chipsets supporting 11D scan.
> 
> To enable this feature, send WMI_11D_SCAN_START_CMDID just before
> sending WMI_START_SCAN_CMDID if the firmware advertises
> WMI_TLV_SERVICE_SUPPORT_11D_FOR_HOST_SCAN service flag.
> 
> WCN6750 & WCN6855 supports this feature.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01160-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e89a51aedf38 wifi: ath11k: Send 11d scan start before WMI_START_SCAN_CMDID

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230315161817.29627-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
