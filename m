Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7784BC83F33
	for <ath11k@archiver.kernel.org>; Tue,  5 Sep 2023 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sbmCRkOC7UTzisg2L3he8FXD1U98NoqluiMdKcpEhbw=; b=m7+3UluQDy4qTA
	rQD21VFclrmF2rd/YGwRsAP3f+4wl0oxjLTw215Pnizh9bd+To5nlHQ+nqjvV9NigKQijbTcqbth8
	z3lWyBiuYveQk9kvKlhCwjECrXV70lQaDkKIooIy1XMWQDJ/IKKtd4kpqrgKdZq5PPsWogtJzJk4W
	xsoiDBZvnVnFkH/1jSbuT0V269MsyhGZDABw5Kjb91g01+V0zhaUcbxXvYRXwa3D1fD3JT8QB6R0d
	nJlf+YcKivEqRCvGaUNjnoIj4edZUupIdIKXflrmF4bB1nOfoVw62KButsr7JTvOFLGmReUnftOqo
	yfeCtTvDpqmf/bJQOZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdW3n-0065hz-0n;
	Tue, 05 Sep 2023 13:25:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdW3k-0065h0-1K
	for ath11k@lists.infradead.org;
	Tue, 05 Sep 2023 13:25:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AEB47604EF;
	Tue,  5 Sep 2023 13:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA48C433C8;
	Tue,  5 Sep 2023 13:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693920332;
	bh=7zk19dbUfCQeOlC5iH3EPz2MBd/m3C2qfHvr3PUWqmM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HJa3JgFDFSeHyvUhTRSCoUOU74sso3R3LSiDO8vo1RnWOOUHnUqXNKoylw1b7uWJD
	 pkOKbBR6g4RwoHlzN77OaJwJbVV/qi6qm+ErJ9nAYPU2YiNKJcmqtOwNAO5zoRut1n
	 kMY4VnK3S9uuH8Rz7ORE3H2pWMpIOEdPWwjlXzU/9+MNGE8mggxXsChrthBML+tnfo
	 oxDGnpMZQ0OlMBwgDEBvDk5u+sVz+ZT9WaN59FP9TceA//mqz+gCRorJcXy60dsRiK
	 r8CjC5GAj7T5UifTVx0+Aj1I3nAyQmphp14SWa7REyzzJG+vRTUgtlxWfICREfWAbE
	 ADy8MeUMQMkvQ==
MIME-Version: 1.0
Subject: Re: [v4] wifi: ath11k: Add crash logging
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230714001126.463127-1-arowa@chromium.org>
References: <20230714001126.463127-1-arowa@chromium.org>
To: Arowa Suliman <arowa@chromium.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Arowa Suliman <arowa@chromium.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169392032901.3610046.4213233908840247809.kvalo@kernel.org>
Date: Tue,  5 Sep 2023 13:25:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_062536_512794_51AC85A2 
X-CRM114-Status: UNSURE (   8.11  )
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

Arowa Suliman <arowa@chromium.org> wrote:

> Currently, the ath11k driver does not print a crash signature when a
> MHI_CB_EE_RDDM crash happens. Checked by triggering a simulated crash using the
> command and checking dmesg for logs:
> 
> echo assert > /sys/kernel/debug/ath11k/../simulate_fw_crash
> 
> Add a warning when firmware crash MHI_CB_EE_RDDM happens.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Arowa Suliman <arowa@chromium.org>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

4a93b554cf9f wifi: ath11k: mhi: add a warning message for MHI_CB_EE_RDDM crash

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230714001126.463127-1-arowa@chromium.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
