Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574E6C433F5
	for <ath11k@archiver.kernel.org>; Tue, 10 May 2022 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dPJcRAciMW1C7PKyDxjWRUH7FhlS76W7ScM4UUT2oU=; b=0HfJry00BAt78I
	oCOh39NKTFOzVQy1W4r9RNzg0WwhHauKDymB+qDxCsiUFI9wefsLdodIhJEpUDZu7druG/u0vLfXv
	Q+wZ4tW5XKQDulebAAbwpP0P1E64lNc31vof8yASQsKu8gFc8qEqGM/Z3ibpG+pRrXz+ldXXBxb+c
	U8OKo7w4LkOv5LAk0kf3eltvfo35tYRYTKG0m8biqEw1nzEhNKIWQDxlarrdR6Rucabqah7LlkJK9
	DNG8IFjU+Ot/tB7cGlJnCYm40xaz8A1mKavFlUh4Qu08bDX6yJK2HewY2M35bOaWwV2H2m3sSLuEH
	ldMc4mVPE1bk/yDwmHYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSK2-002vby-Pb; Tue, 10 May 2022 16:02:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSK0-002vb5-K5
 for ath11k@lists.infradead.org; Tue, 10 May 2022 16:02:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 313A360DB6;
 Tue, 10 May 2022 16:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93960C385A6;
 Tue, 10 May 2022 16:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652198567;
 bh=s58tRb8Pn+W4p81rLCw5rVH06ylo9D3iqgXoSE3Hocg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=jffuEJUfIFzTgGhepG1mYOYzEDKZy/Q2cjSvLpv51jQIYA+mgroDD73TO1g9k8lwV
 NXlyVEdwwKboT2Qtc9u2j5CEdY/LlKYHf0d+GhH4DpinZut+TBhl+EHFgqJNSZMOg6
 fwv1jkcGiZIwDBRaI6uEGEZKa16jjMgdrk/W63hDtfkIXgA+F1ZN+HoR+GEfb5ihsB
 S8It+HtXAgkCMCNEn6rHnWZ1zhVYnGYNxShJkjB4OqR4/wZEphpFpa6nohPBdnb7cu
 C/g5tgT+q95PLm1eAhjf4N+82oy5T7PnJkiYAL8huxd623h5JKBVHUKuKY+mfp4bnQ
 KaKo3f4Wzzh0w==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Sriram R <quic_srirrama@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: update missing mumimo and ofdma stats
References: <1652152236-12038-1-git-send-email-quic_srirrama@quicinc.com>
 <a4e023e1-9c8d-bdfe-1060-48a68fb46e74@quicinc.com>
Date: Tue, 10 May 2022 19:02:43 +0300
In-Reply-To: <a4e023e1-9c8d-bdfe-1060-48a68fb46e74@quicinc.com> (Jeff
 Johnson's message of "Tue, 10 May 2022 08:54:46 -0700")
Message-ID: <871qx18jfg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_090248_746399_A209316C 
X-CRM114-Status: UNSURE (   8.68  )
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

> On 5/9/2022 8:10 PM, Sriram R wrote:
>> Update the missing MU-MIMO/OFDMA info in PDEV RX,
>
> nit: can we use MU-MIMO and OFDMA in the subject as well?

I can fix that during commit.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
