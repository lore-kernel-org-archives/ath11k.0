Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DD2C433FE
	for <ath11k@archiver.kernel.org>; Tue,  1 Feb 2022 10:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5UQPCXNzvrWfswnabryMryj3gm+7j3Hjp0BRvfPt5I=; b=zQjAb/Rl/+h2xh
	402Z3NhEXlqiTPJOr/D4u806RrRfNfVmUB913qKCscmEu0AEXxPVTuCOh6x95TSlJcg+rtyZXQvhK
	RqhIH8UF6l4fKbzvFBwc2+4u9nKcxyBqpIU5RAhjIGCDqZBo3YvQwW8vtHqKrXNc6XmSRJffxZaZ2
	oVjuohTNx4tY3nYsp4ME3kFmSsciytMO1sADpopv0nMMl7DpTPPYhWWaVua5aaIQkzLCE/ZWGAM9I
	irxew4+Qq4Xh4SQ0N68vJL+WLc40JKuoUvuy17pNQkiI2GsMy0Zx9oUkT75+0X3VChhlr7aOtPstn
	5mjXHuMLRz3Tfc6BiicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEqqh-00Bn9o-4A; Tue, 01 Feb 2022 10:57:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEqqe-00Bn9U-5I
 for ath11k@lists.infradead.org; Tue, 01 Feb 2022 10:57:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D814AB82D4D;
 Tue,  1 Feb 2022 10:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A79C340EB;
 Tue,  1 Feb 2022 10:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643713037;
 bh=dcw3g1XG1ijlkNOculpPUddmc2hf4nc9efO+ky0KgWE=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=kcK6fG9EhmLU/4zz1CbyOVw09pYgd/W4EML5+T+PmyBoJZiVDqXtgv62jcQlNSQwG
 U+GfJq9xpZ+WdugwUiQ47c1ERi3sXu2TvyKX57qZrauwr4GWkle4Rc42aT8MUpB3x3
 IVqlqL8su5eehtWTMCTX+F91cdC71jgEgrX7q9vNtEl5AGttzuBLYLADLypgzhIKSi
 r6H+Z7j/vgtVBPHxsEtcoa9tHn6xdb1Ps8bcm60OOXBHNvC5BSo9EyBFbEYN88g6ZS
 H56926BXikqwps3aWslmpO+wqyz8ZI4U7Lr/ddo1JjW6VSkrGwHYK7b2ffqfQX9aOr
 iMLY4eYgJ64hw==
MIME-Version: 1.0
Subject: Re: [PATCH V8 1/2] ath11k: add WMI calls to manually
 add/del/pause/resume TWT dialogs
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220131031043.1295-1-alokad@codeaurora.org>
References: <20220131031043.1295-1-alokad@codeaurora.org>
To: Aloka Dixit <alokad@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164371303517.12561.11692936701884999707.kvalo@kernel.org>
Date: Tue,  1 Feb 2022 10:57:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_025720_380302_30A71645 
X-CRM114-Status: UNSURE (   6.99  )
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

Aloka Dixit <alokad@codeaurora.org> wrote:

> These calls are used for debugging and will be required for WFA
> certification tests.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01179-QCAHKSWPL_SILICONZ-1
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

3d00e8b5b818 ath11k: add WMI calls to manually add/del/pause/resume TWT dialogs
fe98a6137d03 ath11k: add debugfs for TWT debug calls

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220131031043.1295-1-alokad@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
