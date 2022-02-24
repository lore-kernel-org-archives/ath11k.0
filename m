Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C192CC433F5
	for <ath11k@archiver.kernel.org>; Thu, 24 Feb 2022 09:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIyFPyYo+32ailBDeAyd80pj79oCAGDMHiTeZNBra3U=; b=uEuHmT9ji/wsXu
	j0gdTlXQFTDqovkvbOCkWf0fRH107GCQJHHAFs9ppQnyk64zJGv7c1RuAq+IsAUvFTI7xPj9bcwdO
	pr8Kaq4EKLqMcDgkuybLHNmTglPRiVXsjGIzC5XTnrH1CaJhL/tRM9wVFCeBrK72EW/33BSxyKCm+
	iG7uA2DgkVvfGuj2cbMHvkM2jA1TLJdwdvCeeN9HE7Wf/Qvxf3831APJjRF8bKkv9hbZ2wjwTHPO+
	/IQiF8whcO8zSXUVjIoL1OuqQvdJLnajptplWozIorRF3f5ooKwqHcyYh7bve5EwtTDlhd0aqLUyO
	TESQyLDamxVNhi+KcdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNAHR-00Haq3-9c; Thu, 24 Feb 2022 09:19:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNA1v-00HT6D-HP
 for ath11k@lists.infradead.org; Thu, 24 Feb 2022 09:03:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 17DB260A1E;
 Thu, 24 Feb 2022 09:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D0DC340E9;
 Thu, 24 Feb 2022 09:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645693398;
 bh=Ye/kOTRU54AFDLMzyPkcnEa1MMb05KmMsi0JsDv28tw=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=WJDrokWBfK0VHDtZfRMZXxCu3t7xyDI0biy+DT9SlP729C1BT0NxDxWaoU/Lkqkj8
 zzodrd13KSyffZxo4IuImFscoiM2s7FXCP3CYsEa0FQ47lHIvaKIXkYOU+6quYmaRL
 EXuf24GBifNbJKQ96tbCSAdaKxLbXSXBpTqmaJYN4KjTK6FWPGcLsxXAHA0DPt7kzc
 pTlXq2UdxLn2KvCtZiDHn3+nx/aKsDPrVHlsTMe99NxZ2YYanylkFTxOdvj8coTKSr
 qsWkODcff+/ePB1WaB1Q5B4m4EscmqERFDAeQzL6WkFxjpgzmojnO/SaIWnbMs1jli
 UqMQEkB24CvyA==
MIME-Version: 1.0
Subject: Re: [PATCHv3] ath11k: add dbring debug support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1645366059-11798-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1645366059-11798-1-git-send-email-quic_vnaralas@quicinc.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164569339560.30378.9204871614230045974.kvalo@kernel.org>
Date: Thu, 24 Feb 2022 09:03:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_010319_679927_F03B5348 
X-CRM114-Status: GOOD (  10.93  )
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

Venkateswara Naralasetty <quic_vnaralas@quicinc.com> wrote:

> Target copies spectral report and CFR report through dbring to
> host for further processing. This mechanism involves ring and
> buffer management in the Host, FW, and uCode, where improper
> tail pointer update issues are seen.
> 
> This dbring debug support help to debug such issues by tracking
> head and tail pointer movement along with the timestamp at which
> each buffer is received and replenished.
> 
> Provide a debugfs interface to enalbe/disable dbring debug
> support and dump the dbring debug entries.
> 
> Also introduced a new hardware param to add dbring debugfs support
> for few hardwares which are using dbings.
> 
> Usage:
> 
> echo <dbr_id> <val> > /sys/kernel/debug/ath11k/ipq8074_2/
> mac0/enable_dbr_debug
> 
> dbr_id: 0 for spectral and 1 for CFR
> val: 0 - disable, 1 - enable.
> 
> Tested-on: IPQ8074 WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

691425b4a41f ath11k: add dbring debug support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1645366059-11798-1-git-send-email-quic_vnaralas@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
