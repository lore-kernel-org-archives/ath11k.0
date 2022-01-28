Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C884C433F5
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHWPB4gNLO7EryQPOB5f04XepUwTSaBvA5XQ8aoRblE=; b=W8bJunfzvtRo9S
	CF1AX9rlQTcgpxdZbL9pbbNXbssRZcOEyKI8HjVBXHoEuCPZbkg9q2EdpYziWUH3sQi1qHEVrMhD5
	d+/PfwT0v+76kslFZhBFYcecnl5i9P9CQANTP2HuD2fhJXElydgBgFi04AuuKMPM8XXsqNxriWD0n
	wi2cF5NCr8hxMwuzheAbvbrhwuSAWFyOpSZssfXLZp+8cz0PM0iMXb4H+Wxyr4fnOA5cU24f25cMX
	jCkFfzYO8J3GnBsTn1sTgRVk0Q+CAG4ElnLLIuFM5JMVD94ViaT1I0T4KoW3aXiRzVL3b0nkzD+v7
	n7VFV7C4ze2mdv62peog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDOhq-001Xlo-F8; Fri, 28 Jan 2022 10:42:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOhm-001Xl9-UL
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 10:42:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 744DC61E8E;
 Fri, 28 Jan 2022 10:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB45DC340E0;
 Fri, 28 Jan 2022 10:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643366529;
 bh=94+xk3kijD/tfXwMq0MLqwhq9v5/ZCQkbFHtYHR4uIU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=fMBer27VyXF7Tsmz7ZjK9lDGzLQ7PQ6Igs2HUcOZhK77LzVbHKI+Gy24VjoEkDQfM
 Ft68pHNhIh4uvXpP2OL/Qs59ngg+kPGomJ24E4Pcpa65EuEpjoY4RCL+VblZa+rW0a
 fpvQj2j3d85i3LzXf9Gje/ylzTfwqxJFAvuZJA0abVQcdcXdESjGymBSO6yPnX76Bq
 aa5cRjFpfija2d0maT7iypE1nA1HSbsQqxwaMexgju2SUr7gcx1xyF5fak5VlKw30X
 NzufE+6Ekmvmb/0wB39c4ocAv7/sHH0TT4Z3IlYhLLv4Rat5SIWJHsKfTAAdqdqGf8
 tXtdgZEQC3F4g==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 18/19] ath11k: Add support for targets without trustzone
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-19-git-send-email-quic_mpubbise@quicinc.com>
Date: Fri, 28 Jan 2022 12:42:04 +0200
In-Reply-To: <1642337235-8618-19-git-send-email-quic_mpubbise@quicinc.com>
 (Manikanta Pubbisetty's message of "Sun, 16 Jan 2022 18:17:14 +0530")
Message-ID: <87sft8f8g3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_024211_052399_09600EC7 
X-CRM114-Status: GOOD (  10.16  )
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

> Add the support to attach WCN6750 and map iommu domain
> for targets which do not have the support of TrustZone.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Is this not needed in the initial WCN6750 support? If yes, please submit
this patch after WCN6750 support has been commited. That way we can
reduce patchset size.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
