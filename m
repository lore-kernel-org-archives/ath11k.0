Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2144D6ED34
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbRBs8q66HqeYJcUez1cWy2sUETyMii7rRRyXVFNBfU=; b=sTasX7Yc3UKuI+CbWVvpRPJ+1E
	pORtt82d8MpWfVuPogwtmKMevepUeQmhkn4oaqUyXpB8kbJfOI5fqu2TjnuePPmaOgjw0FMLCXc85
	WPyQftV0DQzQ4jUscQgB0FKALyXsrp9l92BRj7B/0XxN4O59235lb5RGVY38FE4nemA3zxjA4dq4/
	y6pyHQNeDLmimq2H0gaVcrIhhcXCCXvo4+pXIyRHSWfw8z1BZK/FHzdeYy2/mRB+9voyyvqUCOvXN
	Y6FpWgQEEutuWkJT+StzPa6OGXpQXleh417I2rIgYiMFMywZwbAGkEw1OIfZJ82cBOTv+xxxhWyPj
	SJ/FYKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE7Uc-000000008lo-2oWr;
	Thu, 21 Nov 2024 13:45:10 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE7Ua-000000008ja-17OH
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 13:45:09 +0000
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A2C7D1140193;
	Thu, 21 Nov 2024 08:45:06 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 21 Nov 2024 08:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unformed.ru; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1732196706; x=
	1732283106; bh=bbRBs8q66HqeYJcUez1cWy2sUETyMii7rRRyXVFNBfU=; b=l
	jQzGDJboBZP75wGPKgOgqN/iodAWpKDcvOr9vNn9YOec9DmTIQ38Tclx5DPbCPAJ
	dFPZdotBXVw9wFFeRtn/MlpkQ9XfZsyXGlfK5L628Tsb8C+KKXNpDXvvo2CBFrPR
	A5PihGnQzITo7LgWT74Xmz+v/veOMInvIOUGSFWCndwFmhxSmT2SLNOo/lfNgYwr
	Oaz305IG5ubJs/kMWqjcKCxLv0j7lqqWolDZWRNgsqI9sgB1qhemdyrMU2Y8UIML
	CyDpCRjMk/KXwazxbYJ4lC5NprF8qajlKNpX+UwqhP7az4P49omADgp0mmMlOIwG
	NeBOXI1BtK4TDTN7e/qcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1732196706; x=1732283106; bh=b
	bRBs8q66HqeYJcUez1cWy2sUETyMii7rRRyXVFNBfU=; b=3b5CZIY7OPBCWNy94
	juU8itl+vO4t8irxs3dythBsuPCimUxSO4DH6HQrpyl5ReS0Ajd+1A+dqzMnxt+I
	6FBac+MMNtA1H2IBW8q5uqBqjPwue/JzqrxOEcJTvQANQHf/9BNf5Q5PjvdLfTik
	kzBZH82MVbEymn+vKXckSQe1CvVTRfz39Et+XfN9X4SEYvCVANSTJg76835jmA95
	d3W4Cw5bYB+MosFSfDAhEDhJMkByz5keeJWLZEeUKN1GCmYwshcGfXjRVCWsUFip
	yD1JUOSAuiqReYjYrTIdX0XWsSk2NTVe8ukYx0JyatAHDpky0+OjlPJrY8/4pyI7
	wXcGQ==
X-ME-Sender: <xms:Yjk_Z8Hud1tYQZSnRaWwavW85tRzyxq-LD9rTcKPPRYe2L-1LmqsWg>
    <xme:Yjk_Z1UqdHIsUF8DkACQymRcPEDR1qziAo8ipKHAYtj9uFU1Cq3Lny5xUn-YDBVea
    PeHF1hDV8kGQkIXpsk>
X-ME-Received: <xmr:Yjk_Z2K8Os0wvZf8jqGGhjIvGNquGdyROLtSR5VxM8NHckn_4YRmS7jmxPCLgsOpvZl3nbU2eGr_Ac0fFNe0i8Tfdvd_9U6bDt__3DxDFnHXh1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeigdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecu
    hfhrohhmpegjuhhrhicugghoshhtrhhikhhovhcuoehmohhnsehunhhfohhrmhgvugdrrh
    huqeenucggtffrrghtthgvrhhnpefhgfevueevteduhffgveffkeejtdevffduueevvdeh
    ffdvfeefgeeuuefgueejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmohhnsehunhhfohhrmhgvugdrrhhupdhnsggprhgtphhtthhopeef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkvhgrlhhosehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegrthhhuddukheslhhishhtshdrihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopehmohhnsehunhhfohhrmhgvugdrrhhu
X-ME-Proxy: <xmx:Yjk_Z-GtfRLpe2Bv0Lm19BdaOvR34wwzn9eDnMBJmSJSkQ7uip0NIA>
    <xmx:Yjk_ZyXzam8NQt10vN9eQfEuLT1iaWBpxT2eZyvy88mJ5bC7tgM8FQ>
    <xmx:Yjk_ZxNh_0NWHa6H22d8pkDh__i8s6XS33HahwiUpru4IDARLz24dw>
    <xmx:Yjk_Z534FM_kMTjZXOJxF3HMm1sII5J3hPg4VIu_WH70UBnr9ZY4EA>
    <xmx:Yjk_ZxS2nRtvOVX1pP_8EcFgtgROglNXeCJZjhlCUxg3cWeCnc8TKAwW>
Feedback-ID: i2649496d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Nov 2024 08:45:05 -0500 (EST)
From: Yury Vostrikov <mon@unformed.ru>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org,
	Yury Vostrikov <mon@unformed.ru>
Subject: [PATCH 2/2] wifi: ath11k: Fix race condition during stats processing
Date: Thu, 21 Nov 2024 14:44:24 +0100
Message-Id: <20241121134424.31006-2-mon@unformed.ru>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121134424.31006-1-mon@unformed.ru>
References: <20241121134424.31006-1-mon@unformed.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_054508_368625_E36296F0 
X-CRM114-Status: GOOD (  10.00  )
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

This diff fixes the race condition in stats processing. This race
condition results in an unbounded loop of stats requests. The loop
results in poor network performance because FW is busy with those
extra requests. The timeout of ath11k_debugfs_fw_stats_request
should be the upper bound of how long the driver retries stats.
However, sometimes some other code keeps calling failing
ath11k_debugfs_fw_stats_request, repeating a vicious cycle
indefinitely.

ath11k_debugfs_fw_stats_process assumes that num_vdev is always
less or equal to total_vdevs_started. This is not true. I've
captured the state of num_vdev and total_vdev_started during the
re-association request:

ath11k_pci 0000:01:00.0: wmi num_vdev:1 total_vdevs_started:0
ath11k_pci 0000:01:00.0: wmi num_vdev:2 total_vdevs_started:0
ath11k_pci 0000:01:00.0: wmi num_vdev:3 total_vdevs_started:1
ath11k_pci 0000:01:00.0: wmi num_vdev:4 total_vdevs_started:1
[...]
ath11k_pci 0000:01:00.0: wmi num_vdev:116 total_vdevs_started:1
[...]

This diff fixes the check to account for this and also adds a warning.
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 436197113ced..ec4683695e73 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -132,7 +132,9 @@ void ath11k_debugfs_fw_stats_process(struct ath11k *ar, struct ath11k_fw_stats *
 				total_vdevs_started += ar->num_started_vdevs;
 		}
 
-		is_end = ((++num_vdev) == total_vdevs_started);
+		is_end = ((++num_vdev) >= total_vdevs_started);
+		if (num_vdev > total_vdevs_started)
+			ath11k_warn(ab, "spurious stats");
 
 		list_splice_tail_init(&stats->vdevs,
 				      &ar->fw_stats.vdevs);
-- 
2.39.5


