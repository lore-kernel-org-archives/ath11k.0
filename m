Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FDBC0032E
	for <ath11k@archiver.kernel.org>; Wed, 25 Oct 2023 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Ncbix9kgLQ6xs3DKqsnVk6TA79/F6vh9DxiLWLGvbI=; b=Yzf+HE103lIePE
	j7eF+sCE02wYYmcoQhrY3fZqs0wV7qNlHZ2E3JXHtmadxi469YPlkfWWfH3eEaPAYZn5cFAmhue4I
	rhyAHzgSLI+3nq0qldwl2kkKZ+h9zi4gEsz1Ln1ewXkAyu0TQh4eA+c2zSna+bCXKcyDsdTOiqlIH
	AX4UVgC0k18qlocthPPC9pCekmBkQWPBuu3W0T+wbUuXwcIa/s/DqpjndiHmfnBki0sKYhVB4ORDR
	Bixa4WoplNm0K5PMDjBenkHo535CNdriUtezD0TY4RRN93s9rli708Q0j6H1UlS/J9Qt5dl/CfD59
	hD9rH83FArPtPakc30ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvbG1-00C553-2U;
	Wed, 25 Oct 2023 10:37:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvbFz-00C539-0s
	for ath11k@lists.infradead.org;
	Wed, 25 Oct 2023 10:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5F714CE2997
	for <ath11k@lists.infradead.org>; Wed, 25 Oct 2023 10:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB672C433C9;
	Wed, 25 Oct 2023 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698230216;
	bh=7Rl8C1Uk+dHF25r0wiSnC9dy7aLIzE0A9eteM9RTuhE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=t/LRDwuWt0ezmpb2wvHnc5DDZMgIQnEDcDTVNVdrkiy6kOp7SuZEjOP57Qkl6rv6E
	 TjqijEbsR1lNpoyT+puU7pPXDFON4zEa/Myq3E8L0CCKxV7v13syy6lZqdk6wUy4iv
	 0RH0chClhab/vd4KPTnXDE3mi1v482d4duuaeGrrOSnoeC5ndSqLF//dhvu1kUX+I+
	 iT/hM/f2Amg4ARaEF7fHQ81MUkMae+I2EHRsQGz9iQjgAMogdS25gW9cq76xx/k94e
	 Jt1f5Vg1NL89WTtutCU5hLSCfnunomCnNLrgJxxFQQbvYBotjYTdAHwsXkLXhawS+2
	 j+EPTbHrt7WBg==
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "wifi: ath11k: call ath11k_mac_fils_discovery()
 without condition"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231023164120.651151-1-kvalo@kernel.org>
References: <20231023164120.651151-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169823021370.891844.8029663919365856343.kvalo@kernel.org>
Date: Wed, 25 Oct 2023 10:36:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_033659_482804_90CDD1C7 
X-CRM114-Status: UNSURE (   4.75  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> This reverts commit e149353e6562f3e3246f75dfc4cca6a0cc5b4efc. The commit caused
> QCA6390 hw2.0 firmware WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1 to crash
> during disconnect:
> 
> [71990.787525] ath11k_pci 0000:72:00.0: firmware crashed: MHI_CB_EE_RDDM
> 
> Closes: https://lore.kernel.org/all/87edhu3550.fsf@kernel.org/
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f59065401602 Revert "wifi: ath11k: call ath11k_mac_fils_discovery() without condition"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231023164120.651151-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
