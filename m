Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B34AC433F5
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4xrXO64GjY93zmm3MTsEN2Gf4coXUfWuAAmXomV3AY=; b=STusefK2EWdfGM
	qdB9wwi8LKfDOqRmKmP7VXa30HteOiIOS+cWyJdy9s3Rn0OovnywIXyjDBFZPlOvIeR3hlRWGU4P1
	3DcXtX1LHVvXsoLEHDHJeDO+VKZoT7XYekWl96od4pst78vwZ5gPK88JwrUqSFattfzxGt645H1ef
	2JHL8JPLnHXVew7Bdrnr9s3fyoN55laoUVeAvIg53OvaovL0LZ+pE11DJRQWI3imA4x/VMBdJxvSk
	x/R3YHaMtBvrPNw2EzRazmUGcJ38CJv2wSpe0m8k1IMR+NXlrmO5hevL12fXb0hfFG02qQiMVfJlt
	rRB6b+CW12KwJlIim7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDRPz-002MMj-4G; Fri, 28 Jan 2022 13:35:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDQy4-002BJK-Ew
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 13:07:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE2FDB8251F;
 Fri, 28 Jan 2022 13:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B2CC340E0;
 Fri, 28 Jan 2022 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643375225;
 bh=pxWu6qGV4gPnmvtpbxKwT+R4/3dtwDdsnq6gyj8JVeA=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=aIQdxCp0tTVwfsAxFSL4puD8RwkqOZeU+SolJzQofux2NuXOSDO2BFOP9qpdRfsOH
 Li/6S04GdcDdxx7Afzh6xAy5f081xFXRXsGRpFYPBAlBM+Lu0T5cg+OxHEFz4Egn1q
 wu3SQScX72OvlgIPKzxM9O+/hQimbmCk7M2nDbBob2Enhh7smi7x3iyxapfh6U6R8t
 hrG04lMFOMiB0v8XRt+TtBk+ax4E985Wg63BKaKjetIF07C2uSVYOk/5byeyEkImzj
 Vy64AlyYhcCaAG+QW3tjG/cv8McmHenCk4vX1CZM9CuzC10BOmCZUMfV7zz5vb61oK
 eRn5YjBca8Daw==
MIME-Version: 1.0
Subject: Re: [V7 1/2] ath11k: add WMI calls to manually add/del/pause/resume
 TWT dialogs
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220112180026.5554-1-alokad@codeaurora.org>
References: <20220112180026.5554-1-alokad@codeaurora.org>
To: Aloka Dixit <alokad@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 John Crispin <john@phrozen.org>, Aloka Dixit <alokad@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164337522291.4850.3161282562927795317.kvalo@kernel.org>
Date: Fri, 28 Jan 2022 13:07:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_050708_680058_21F8F022 
X-CRM114-Status: UNSURE (   6.70  )
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

> From: John Crispin <john@phrozen.org>
> 
> These calls are used for debugging and will be required for WFA
> certification tests.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01179-QCAHKSWPL_SILICONZ-1
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Aloka Dixit <alokad@codeaurora.org>

Fails to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/core.h:603
error: drivers/net/wireless/ath/ath11k/core.h: patch does not apply
stg import: Diff does not apply cleanly

2 patches set to Changes Requested.

12711826 [V7,1/2] ath11k: add WMI calls to manually add/del/pause/resume TWT dialogs
12711825 [V7,2/2] ath11k: add debugfs for TWT debug calls

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220112180026.5554-1-alokad@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
