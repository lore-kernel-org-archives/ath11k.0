Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878AEC282C5
	for <ath11k@archiver.kernel.org>; Mon,  3 Mar 2025 08:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GXCR2/qllsmPA+9VDf1WpC/D25nO4d0B9V4QL8xXBpM=; b=uUWWvW4VaKfF0TS4swk5TG8D8k
	jvzyVZWyPSQGHwqmfYwF9Ewvzcb7HVswJKMW/6pm/M/Na1RJLMrcnSHBlOd57zeXstyWXKsK2c1d8
	Juwy6iGWcI1F8znKmd9YgusBANFEKZHfo8YozJImL7hcpKpIBvzIVjZcGrBjMVj75N9iJ4LFF+WmN
	t+yMLkU70E+4htM0f8SN0+Y+DQep2mlMwmzwRKbuO56Z+pmuToLojDlXoH/Elyk6l0DJephzbtdq2
	uTsaWRVPsuw6NEmzn8hEsTUZ3V1JexmWiaQyCFBkRO2JJY3iM8syH+I62XgtcTF8ZQWP6i9A0/2PZ
	L9Vphwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0ra-0000000HU1A-2qm5;
	Mon, 03 Mar 2025 08:09:22 +0000
Received: from mail1.crpt.ru ([91.236.205.1] helo=mail.crpt.ru)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0rW-0000000HU0k-3jbF
	for ath11k@lists.infradead.org;
	Mon, 03 Mar 2025 08:09:21 +0000
Received: from mail.crpt.ru ([192.168.60.3])
	by mail.crpt.ru  with ESMTP id 52388PGD020784-52388PGF020784
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=OK);
	Mon, 3 Mar 2025 11:08:25 +0300
Received: from EX1.crpt.local (192.168.60.3) by ex1.crpt.local (192.168.60.3)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 3 Mar
 2025 11:08:25 +0300
Received: from EX1.crpt.local ([192.168.60.3]) by EX1.crpt.local
 ([192.168.60.3]) with mapi id 15.01.2507.044; Mon, 3 Mar 2025 11:08:25 +0300
From: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>
To: Johannes Berg <johannes@sipsolutions.net>
CC: =?koi8-r?B?98HUz9LP0MnOIOHOxNLFyg==?= <a.vatoropin@crpt.ru>, Jeff Johnson
	<jjohnson@kernel.org>, Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>, Govindaraj Saminathan
	<quic_gsamin@quicinc.com>, Bhagavathi Perumal S <bperumal@codeaurora.org>,
	Rajkumar Manoharan <rmanohar@codeaurora.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: [PATCH] ath11k: fix overflow in tx stats calculation
Thread-Topic: [PATCH] ath11k: fix overflow in tx stats calculation
Thread-Index: AQHbjBNwlu6FEnv6mkuda429t7F2NQ==
Date: Mon, 3 Mar 2025 08:08:25 +0000
Message-ID: <20250303080819.48872-1-a.vatoropin@crpt.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.200.60.21]
x-kse-serverinfo: EX1.crpt.local, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean, bases: 2/17/2025 9:52:00 AM
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-FEAS-Client-IP: 192.168.60.3
X-FE-Policy-ID: 2:4:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=crpt.ru; s=crpt.ru; c=relaxed/relaxed;
 h=from:to:cc:subject:date:message-id:content-type:mime-version;
 bh=GXCR2/qllsmPA+9VDf1WpC/D25nO4d0B9V4QL8xXBpM=;
 b=cVRnCZE2yRwZueFBHy4v+SikDM43pylMgfh911GYqPN0IIt3BSzNGN8ZlKb4vq/dq6CY2qpD4sfg
	8kRyBybkjfO93Vpxt0HV5zMAGEIcdTOmls/gMqxjyK9DRaPFWd8FWIq+bAPIMDLC72Pq0ZafQrM/
	xkJKWHQtjde+9Y/OdG/WYtLulJ6X7ojMB1n/zUWXkKLUcTvhw0XU4H6EdBz9kmGEvuV5vTpSZH0Y
	/8kTPSblVtkLGX1AiybAcIR7naqN66Q8716J6HMQGkYdY7HPAzKtmKWHaS7Fy3/hb18+hHkhSGsA
	qTQuNNn92yGO2ALB9srRBlcPXvw5W4B2bqxLzg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_000919_802855_569B3EB5 
X-CRM114-Status: UNSURE (   7.63  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Andrey Vatoropin <a.vatoropin@crpt.ru>

Size of variable peer_stats->succ_bytes equals four bytes.
Size of variable peer_stats->retry_bytes equals four bytes.

The expression peer_stats->succ_bytes+peer_stats->retry_bytes is currently
being evaluated using 32-bit arithmetic. So during the addition an
overflow may occur.

Since a value of type 'u64' is used to store the eventual he, it is
necessary to perform the 64-bit arithmetic to avoid overflow during the
multiplication.

Found by Linux Verification Center (linuxtesting.org) with SVACE.
      =20
Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
---
 drivers/net/wireless/ath/ath11k/debugfs_sta.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wi=
reless/ath/ath11k/debugfs_sta.c
index f56a24b6c8da..982a7add6ea6 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
@@ -69,26 +69,26 @@ void ath11k_debugfs_sta_add_tx_stats(struct ath11k_sta =
*arsta,
=20
 		if (txrate->flags & RATE_INFO_FLAGS_HE_MCS) {
 			STATS_OP_FMT(AMPDU).he[0][mcs] +=3D
-			peer_stats->succ_bytes + peer_stats->retry_bytes;
+			peer_stats->succ_bytes + (u64)peer_stats->retry_bytes;
 			STATS_OP_FMT(AMPDU).he[1][mcs] +=3D
 			peer_stats->succ_pkts + peer_stats->retry_pkts;
 		} else if (txrate->flags & RATE_INFO_FLAGS_MCS) {
 			STATS_OP_FMT(AMPDU).ht[0][mcs] +=3D
-			peer_stats->succ_bytes + peer_stats->retry_bytes;
+			peer_stats->succ_bytes + (u64)peer_stats->retry_bytes;
 			STATS_OP_FMT(AMPDU).ht[1][mcs] +=3D
 			peer_stats->succ_pkts + peer_stats->retry_pkts;
 		} else {
 			STATS_OP_FMT(AMPDU).vht[0][mcs] +=3D
-			peer_stats->succ_bytes + peer_stats->retry_bytes;
+			peer_stats->succ_bytes + (u64)peer_stats->retry_bytes;
 			STATS_OP_FMT(AMPDU).vht[1][mcs] +=3D
 			peer_stats->succ_pkts + peer_stats->retry_pkts;
 		}
 		STATS_OP_FMT(AMPDU).bw[0][bw] +=3D
-			peer_stats->succ_bytes + peer_stats->retry_bytes;
+			peer_stats->succ_bytes + (u64)peer_stats->retry_bytes;
 		STATS_OP_FMT(AMPDU).nss[0][nss] +=3D
-			peer_stats->succ_bytes + peer_stats->retry_bytes;
+			peer_stats->succ_bytes + (u64)peer_stats->retry_bytes;
 		STATS_OP_FMT(AMPDU).gi[0][gi] +=3D
-			peer_stats->succ_bytes + peer_stats->retry_bytes;
+			peer_stats->succ_bytes + (u64)peer_stats->retry_bytes;
 		STATS_OP_FMT(AMPDU).bw[1][bw] +=3D
 			peer_stats->succ_pkts + peer_stats->retry_pkts;
 		STATS_OP_FMT(AMPDU).nss[1][nss] +=3D
--=20
2.43.0

