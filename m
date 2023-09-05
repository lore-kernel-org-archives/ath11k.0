Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83769C83F3E
	for <ath11k@archiver.kernel.org>; Tue,  5 Sep 2023 13:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bv2dC6xpRrSOhumYhu3cacfav4fu69TGbSvObo02bCE=; b=su99iPWQ4KpG8m
	PZQvgcHcTwPC6MQ0AOTH+vZyghb5/XRaEdSrGC306fBvcnG4495UWjReKLJHQ4RCmtDoLJSgSnamU
	g3KyPCziyvh1VX/U8eQaKPSiNFgolBuclghz48VLZrZXgAYAX5BM+ZdwGSqtXWHB25bu0lhH/7j6g
	dOvm7InblpZiAG+NozM8Bno+dZjtMGh6AGzQ+YyQwl1N6oPzwNf8OZ0aS1tgGBS0LIC9U5/Nj2Tup
	GvhAchEy/nOLpnlOtDInJFtz5sGFJP5IcYzrtSZZ3vf8k4mfyu8JtiIZwsjRC6DfwQtmlKft0rhgJ
	ODUpUP9vJNpo/31qbLLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdW5v-0065uY-2s;
	Tue, 05 Sep 2023 13:27:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdW5t-0065u9-1t
	for ath11k@lists.infradead.org;
	Tue, 05 Sep 2023 13:27:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0E54BB811DC;
	Tue,  5 Sep 2023 13:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D088DC433C9;
	Tue,  5 Sep 2023 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693920466;
	bh=pnk4sCutSBEzjsIxmj9YusKcT1QMT0+L2O9Zh5dmwfc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=dyq65rDsVSFKcwIZ+wwrS/9SXVflJNfMjjsxuefUX61FJn7k5Wtdook9ZMubPEcCK
	 3V87rB6M8woLLCiOzu2jN/kd7QBOGlOqORUGLXzzy3DgkB1v+CWiWYgz2vQdF+kk5W
	 fLjy/iHOax1N2L7k628/LsDu0HYnEUkzf1ORRVZDz7HI6cZ4+3x4WgDzgcGDRyg4Dn
	 TmMjS2x0YUfr2AikADPdShR2TsEgA1WSM/2YhuEQfakAiKzeEd8Ivpxanq+eD4MmI3
	 G1GtfcSUbD2AgjqRpJugW764S3Z/JD42BXUsoslTXruF6BeZbISaXo/4MRXCoXhxFx
	 m0COjz0dkeQgw==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath11k: move references from rsvd2 to info
 fields
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1692827868-15667-1-git-send-email-quic_msinada@quicinc.com>
References: <1692827868-15667-1-git-send-email-quic_msinada@quicinc.com>
To: Muna Sinada <quic_msinada@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Muna Sinada <quic_msinada@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169392046359.3610046.160119621515674643.kvalo@kernel.org>
Date: Tue,  5 Sep 2023 13:27:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_062749_756037_299D0EF2 
X-CRM114-Status: UNSURE (   7.09  )
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

Muna Sinada <quic_msinada@quicinc.com> wrote:

> Remove references to reserved fields and add new info fields for
> struct hal_rx_ppdu_end_user_stats. Reserved fields should not be
> accessed, therefore existing references to it are to be changed to
> referencing specific info fields.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00356-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

5bd2ced044bb wifi: ath11k: move references from rsvd2 to info fields
7791487cd16c wifi: ath11k: fix tid bitmap is 0 in peer rx mu stats

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1692827868-15667-1-git-send-email-quic_msinada@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
