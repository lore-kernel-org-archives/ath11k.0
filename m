Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B6FE732E7
	for <ath11k@archiver.kernel.org>; Thu, 28 Sep 2023 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gB4NuLWVkEyetjfYkUEpc0C5DfF270ddiMHlgh7uadA=; b=UpJB8n7lvNYSBI
	+Z2J7ITHEFkyU6lDCsa+Vt9JmIBv3NAmFxpY5DEnCu8phtuF+rNtf9Yw55hDGQDmgZfk0fL/EjwGT
	YBwmv2Oa1683uL5pFI+/IMZOdais8poIZ3IKC9xxWrkykmX/i2wuEMvfkHdUcuqDgJgLUME2laIcG
	YEHOVRUMdlE+s63kd2HJFmiMZ2dCZ4cHnkdSHNLhvHFYtJbgi4n5t3+ywDr/x0vITtEI50kpq/smh
	L5jbrmJ/6jldjn0PiT+AmT3a7NWiSZ9n5DtwKWs1x2oskkaB/LUmqFJBeZ2mBCuKwmaaj5dQ85gPJ
	dAVwF8psefqT1hgr/YPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qltEC-005cUy-1H;
	Thu, 28 Sep 2023 15:47:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qltE8-005cSC-1r
	for ath11k@lists.infradead.org;
	Thu, 28 Sep 2023 15:46:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 30B3FB81CE9;
	Thu, 28 Sep 2023 15:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F9FC433C7;
	Thu, 28 Sep 2023 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695916014;
	bh=KCQCIRbsa1m6qTWh9HIbZJWA7KSkVBIONtP4ro1bci0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=mf8uvYje4sSGnByBOhDNCm480tZwXE8q+Bk01qYVSZFutC9p4vlKhrvF3QD7dPo77
	 0KaYfdkRDWh3IqKbaOBEYnCPZyiTehqt6Erz6YQEicAJOaZQ//LeSY1MpDbXHjijEF
	 thZj4J2TAdrXg8nN8cnCe8OGA8zi8IrxvTddpCpq24dtjw41iDTceeGXPMj07SIMN2
	 5NOCuf7YSsIA79ffkZG5fY71ww4j9rydoI65DnXI28j7Smm8hEnzm/dXI5sIMphVBg
	 m9Mt1Wz/w26O8uuoiTDZPuBD9XzkcAxXB7Hq4iN5MOWgVIIFvjbxqtC19dc7ruwunU
	 9o57+43RnaPLA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: drop NULL pointer check in
 ath11k_dp_rx_mon_dest_process()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230907083852.10775-1-dmantipov@yandex.ru>
References: <20230907083852.10775-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, linux-wireless@vger.kernel.org,
 lvc-project@linuxtesting.org, ath11k@lists.infradead.org,
 Dmitry Antipov <dmantipov@yandex.ru>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591601112.3096214.11174520645995155662.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:46:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_084656_761065_EFB0F6CC 
X-CRM114-Status: UNSURE (   6.87  )
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

Dmitry Antipov <dmantipov@yandex.ru> wrote:

> Since 'srng_list' is a fixed-size array of 'struct hal_srng'
> in 'struct ath11_hal', any of its member can't be NULL and
> so relevant check may be dropped.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Failed to apply.

error: patch failed: drivers/net/wireless/ath/ath11k/dp_rx.c:5094
error: drivers/net/wireless/ath/ath11k/dp_rx.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230907083852.10775-1-dmantipov@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
