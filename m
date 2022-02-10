Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201A1C433F5
	for <ath11k@archiver.kernel.org>; Thu, 10 Feb 2022 06:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pdx42uhCDsMCd1DViy5MBkAAjJWK5iHfdpcngXmS9Us=; b=0GJNVD4rT/1dlg
	xXua227ZjhitG3gmEDPHhaq4tEIze9YZcAprgdZqpId3JycmB4ML1QI+uMPwARIYmUJSHXLebmkrK
	TF5uypc3uetu+asZk1E83ne0oCGFpSwnA7L8tCSajy2cUyXxcT3pfE5iSNqgMTpsY9jJbAwWdFISV
	WPzbsJTcL7UsCMF77bqNuN3OiZsVhDZDnWxde8OVGC9/w0YHJnMHdAeVC0giiXpVaH40MW/U1PWNV
	sAFbjBF4aQuGbjyTaYJGKFB1gZ6byjxZuNk3ltPCp8o4IuhD+MRI00ib8o/Rm2/vpOr9Ts9hYi3dM
	DQiSKg31xwK3fNzegocQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI3BP-002oQY-Aw; Thu, 10 Feb 2022 06:43:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI3BL-002oQD-87
 for ath11k@lists.infradead.org; Thu, 10 Feb 2022 06:43:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 05F10B823DB;
 Thu, 10 Feb 2022 06:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD109C004E1;
 Thu, 10 Feb 2022 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644475431;
 bh=pXQiyMaauFh8Bj8MjlVGhSxfr8jsid80WwPF8tabY/Y=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=qM7Rz7GcSXowP0Z0iHfglJSlwIZfWr7W5yJdLHYKdhJKAtqKoZKUFve6jiKBT2nLK
 UpOtKzk+irJB6EJpGs6Ih3odeYb88VFf/PFGtosGM84xtxHx/hj+mKwqNLazu1yrcL
 c/bVSdKctHmhhpWCfuSoHCHMiJcPWawNsN2pS6YpKFaIDQ88QdlNOF//eWIdGhiIPf
 iPS5RdIurLcpRrxIqcOSqi7g8hJZP7x/eYDxYS7C8Didj/zQsP+uRYwlJ64r0PJp/U
 /daOKNzoB4O9FhRiTc1o1htCS0sqcMLlBzgniQUUBixnmhl5Wy3AM5tJ/gEYptZ2HV
 GLkc8qoRjS+0Q==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Carl Huang <quic_cjhuang@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 1/6] ath11k: Add basic WoW functionalities
References: <1644308006-22784-1-git-send-email-quic_cjhuang@quicinc.com>
 <1644308006-22784-2-git-send-email-quic_cjhuang@quicinc.com>
 <23784b65-745a-b269-74c9-172d414ed752@quicinc.com>
Date: Thu, 10 Feb 2022 08:43:49 +0200
In-Reply-To: <23784b65-745a-b269-74c9-172d414ed752@quicinc.com> (Jeff
 Johnson's message of "Tue, 8 Feb 2022 12:55:10 -0800")
Message-ID: <87r18brzkq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_224355_505753_5D1B0938 
X-CRM114-Status: UNSURE (   9.68  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 2/8/2022 12:13 AM, Carl Huang wrote:
>> Implement basic WoW functionalities such as magic-packet, disconnect
>> and pattern. The logic is very similar to ath10k.
>>
>> When WoW is configured, ath11k_core_suspend and ath11k_core_resume
>> are skipped as WoW configuration and hif suspend/resume are done in
>> ath11k_wow_op_suspend() and ath11k_wow_op_resume().
>>
>> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>>
>> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>
> Carl your S-O-B should be last since you are submitting the change

I can fix that. Should I also add Co-developed-by tags for Baochen and
Wen?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
