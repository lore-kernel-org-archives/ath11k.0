Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8E7C433EF
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 10:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zf+8p/dMPqhlInEe/wF7av3KrTgwl3UDqIfPeV9qTpA=; b=LR494+FYP3CgEk
	v4SyHHJSw1pIo2Zmzv41gEBpQo6uPQVNVZaBJeslsWIwtX+YxJDMwkABiIGbu4v2aN2JRENkIgs+m
	n4SKk6wj4ynebYEE2gmMclfCDM18cx5nX+es9e0XLMgJ1UYWyDqvMruZGTEtfyOeFd9T13NYeKHMJ
	fL8bzFXTwFSI7uIwI1iDbBZ6ZDkrUiB61q8MsiCKQfPIHp0C02yMn5637xc7hCg/wbFBQRGPfMr7n
	xLAfAAVdpqBVMuN1SQeEUz58OO+W8WU22ycHKLA3gwpQnUye7pi6BCi3/OBbwly0vs8fxoAMoZ5Nm
	+l97sCVPfjIzfr/PwE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDOpy-001YRn-Ka; Fri, 28 Jan 2022 10:50:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOpw-001YRS-05
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 10:50:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 85C6861E96;
 Fri, 28 Jan 2022 10:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA891C340E0;
 Fri, 28 Jan 2022 10:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643367034;
 bh=AwHz/9028/BB+o2wJdlF0quiUktHVDmT+1V1QIlbCgU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Ffie739NVTRnWab+sJXAjyYQSWIvSrfwXIjklhvzT+mjZs0/2NiSm5GiKbxgpHFwz
 Gmw6KDBMnzN/Mb9PgJr9XXtyy67f+s3BQQLKekH3jlfUA8KKIZLpOCalzuVjEwIbnn
 21afcTyGHFKI7yNE2u50xDSvxZmr0gKk3rMXYDR5/Be7YJT4Kqcze6GoNa49pPSdPx
 eJVO7fEX3Zo0h1Z8wi27diPBcPWuDNV6ROsuB5EDWJxcPj0PgwRR5+ESUpBXNHLZ2m
 SvJGk3+MJTfPntuDZFVjMlfxkFtcWXJX0CZPAUB7ryqJy9CU4fTkgUC+YWtlJ6rP2O
 Q6QHfVAG1AEfw==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 10/19] ath11k: Add QMI changes for WCN6750
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-11-git-send-email-quic_mpubbise@quicinc.com>
Date: Fri, 28 Jan 2022 12:50:30 +0200
In-Reply-To: <1642337235-8618-11-git-send-email-quic_mpubbise@quicinc.com>
 (Manikanta Pubbisetty's message of "Sun, 16 Jan 2022 18:17:06 +0530")
Message-ID: <87o83wf821.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_025036_101173_2AA5C68E 
X-CRM114-Status: GOOD (  17.28  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> In the case of WCN6750, FW doesn't request for DDR memory
> via QMI, instead it uses a fixed 12MB reserved Memory region
> in the DDR which is called as MSA region. As a result, QMI
> message sequence is not same as other ath11k supported devices.
>
> Also, M3 firmware will be bundled into the FW and will be
> downloaded to the target as part of Q6 boot.
>
> This is the QMI flow in the case of WCN6750,
>
> 1) QMI firmware indication REQ/RESP
> 2) QMI host capability REQ/RESP
> 3) QMI target capability REQ/RESP
> 4) QMI device info REQ/RESP
> 5) QMI BDF download
> 6) QMI FW ready
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

[...]

> @@ -2490,6 +2497,13 @@ static int ath11k_qmi_wlanfw_m3_info_send(struct ath11k_base *ab)
>  	struct qmi_txn txn;
>  	int ret = 0;
>  
> +	/* In the case of WCN6750, M3 is bundled into the FW
> +	 * binary, and will be downloaded as part of Q6 boot.
> +	 */
> +	if (!ab->bus_params.m3_fw_support &&
> +	    ab->bus_params.hybrid_bus_type)
> +		return 0;

A check like this makes me think if it's just better to m3_fw_support to
ath11k_hw_params. That way you could disable m3 for WCN6750 via
hw_params.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
