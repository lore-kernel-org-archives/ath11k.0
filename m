Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A23C46CD2
	for <ath11k@archiver.kernel.org>; Tue,  9 Jan 2024 12:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FahTWILUCyuKWmBjrgE34jyax2NQRjPjVTWRH545HZc=; b=ZTyh9hpQMIoxVXdgCwwkQkh2AE
	aDMaPiB7qiiRNHmArliYVyz2sPJPcxrLzqm9IlrlTSDsN7vUV/CEmlYz7YtFb7UWVDoQr6mR0A/1H
	z9t/4YYKv4CVBh+govkQ3Uf3kt8ZH9XLEiqikrgmheSUZ5DA8EQiEEwMmXdZG5eb5eeXeUh+alpT+
	Ig7tabyvaCIocKv5SmznGu/yLs30rTTMLrWlda8a/WDObDv8UceBGfy2C26sUR4hHccAdXT01/hiW
	jvhXJafD0xJe8nuc0sC56TLQ21atMRIx5yo9PwUV/bbkVdlbhs8KBVh8VeBCmRHPICgRpvwhG9+iL
	jIC6u3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNB7I-008Dzg-1r;
	Tue, 09 Jan 2024 12:22:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNB7F-008DyS-22
	for ath11k@lists.infradead.org;
	Tue, 09 Jan 2024 12:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 52E56CE1733;
	Tue,  9 Jan 2024 12:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6686C433F1;
	Tue,  9 Jan 2024 12:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704802913;
	bh=32dtlFEDmpYlPSuhrYgC24OmzGy3LLUIz4NejUJYmfo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=NrUzDHwNdGpM4+2mtFd7OoYZMOpVmswXM3nJlpln4amDyPBMzL1CYBiowbCOh5PFh
	 mRycWGNDMDQg60sNtoXYtWdScxvr4PptUKIQhvRiBYpyWd23591hVbEOQSAhzBD1Yp
	 UAm+Rx45D6aFmt1xXY2tDtPYhfFQ5kflgoNHAc/9/8i9KfIbCTcE12BHRGKfK9g6md
	 9PfUJGl6ZGg3qKrsLP2/6wJZh4Lj0Pj06d9cQO0/a39XByNDqQhmsS6M1EjzEdwrDH
	 2sZvaUWfMEpvu5bJS3j2nSHN9X0x7IO0fPWOlbnY5kCoWNCunLUn12htoL5vx0aJ+0
	 pPCi2dp5b37TA==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] wifi: ath11k: add support for QCA2066
References: <20240109021336.4143-1-quic_bqiang@quicinc.com>
Date: Tue, 09 Jan 2024 14:21:50 +0200
In-Reply-To: <20240109021336.4143-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Tue, 9 Jan 2024 10:13:34 +0800")
Message-ID: <87frz6ely9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_042157_845642_EECE980C 
X-CRM114-Status: GOOD (  13.31  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> QCA2066 is a PCI based DBS device. It is very similar to WCN6855
> overall: they share the same PCI device ID, the same major and
> minor version numbers, the same register address, and same HAL
> descriptors etc. The most significant difference is that QCA2066
> supports 3-antenna configuration while WCN6855 doesn't. To
> differentiate them, subversion numbers are used. Currently four
> numbers are used by QCA2066: 0x1019A0E1, 0x1019B0E1, 0x1019C0E1
> and 0x1019D0E1.
>
> In order to read subversion register, pci.ops needs to be ready
> at that time, this change is done in the first patch.
>
> The second patch enables support for QCA2066.
>
> v2:
>  - Rebased on ToT.

And the firmware is now available here:

https://github.com/kvalo/ath11k-firmware/tree/master/QCA2066/hw2.1

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

