Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35B7C531FC
	for <ath11k@archiver.kernel.org>; Mon, 27 Jul 2026 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aCP7o02Y8I/xfGf3dGEk8zMltx8sX5iT2Za0pUwKugE=; b=psKHC+ugpXZ0k7UTrV7+rplgmP
	lgM2Xcsd9h1tkwRjQMf+CEAkHVcCOX38cmeFFSJC4zyVOhvuPZ2sve8/KHhGhAHwSkMATasnxvkcW
	Bhsfhc+CB8sqjKazh+Vz7jivT31dkZwRM12NFUyFsgNZcCs2uHuFX4WMPJszuftP8QDFV/miv62wP
	EBPgNFJ4MCkmDGsxU3j12skxU2lpInGd5m3DnahU1PLLfunwKSBcMlG4yCFWQXmqbI2oLmrzrNa5n
	rmRJwZYNavSL9Oz8B3tXIpwhpdxfLM5++S745SSgfdPmQS26GuxPeHc8bMXZl+BM9ZNBgKUxrJfHd
	ydS8SmWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNHB-00000003B2S-26J9;
	Mon, 27 Jul 2026 15:29:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNH8-00000003B1e-3I6p
	for ath11k@lists.infradead.org;
	Mon, 27 Jul 2026 15:29:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDldMk3905491
	for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 15:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aCP7o02Y8I/xfGf3dGEk8z
	Mltx8sX5iT2Za0pUwKugE=; b=WYfoJWar3ooaV9cJywWtCXVn47vd44paedwCcT
	s3PiFVlFCpPityAaUTQ/e4GZHmZ66B5v41gNSlZ3imoFoTgmwRdOiRc182jW1NjK
	EDi1dgrZr/dttr4Pq1sbSbwqmr1ZNs7iE8nq046bn2Z8XTUByy6NOXA7lgG+0sRP
	R1r7zm0s06pcSlTo0T9+oAIpqfUQ6RWSI40UFkCyYk7XU3fWF4WOWKrCSboNz/eD
	TGLi7FOkYtFIjFOKHsWecvlBeAWdIS3rMuF51+cK67GOJhk0+CAA/+XnrSuPXgHx
	iUGo4mhjoW4dqgZsx38CVwtuo27ufLihgcR2if8EP6Zqifhg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uksdbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 15:29:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso3390428a91.0
        for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785166193; x=1785770993; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aCP7o02Y8I/xfGf3dGEk8zMltx8sX5iT2Za0pUwKugE=;
        b=cGsf2DMwloU2kjBmKKEks/9zifBZnckFdznIRzi6YFwBXW9EP5fTS0uBv4Ly9kInkA
         +udS2VZuZuTVTZunGRDLohPsA5/uiMUpl+cVzvwstkW4MM/wePuExBoXocYOgNQDJvKJ
         b0K++AGkW+DfarRXmQMFLrI8CgpHEHbRzeoAO3AicHpcoDRKsd2xYsBV8FlUVrTXYc6/
         CK+z9y61Bt38ndE9hRqYVnSJOilYyrOYJt+qeSNShj4QIeJx44z7J89XSJaSpITd5BYY
         GamFBW+YcMrkEHFxyxrfy8msa3oRmsdY4qmZW+v6JaQ6B6AkOa8ivm46ufXQsZyPixK6
         1dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166193; x=1785770993;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCP7o02Y8I/xfGf3dGEk8zMltx8sX5iT2Za0pUwKugE=;
        b=URqIBI8j0dSLgKiYuEkJxMaD3n1rJuyF445HhiItNwIpthayXMgjR7l/4ZgZC2NO8U
         m1S8Q8h8pJnLvP70B559+E0/++PsghWE4pFLHnVle2kVBEBUh7m1ppwKlKN6ZHOz33eY
         /Gn+O9MC/E+R+LCIpzTKeVxnlBQzSEbvoe5wb5Yr8yL7aS3n+1jTly68eYVKkURdej4P
         vmSmOX9yWGdth9TpRqtArbsthClkSqOu59szxKimqIxgkFEcrGFc3VJ0Lm3glbJL3iO1
         fzoKuByv2it77OZtje65Go+pDFZyk2ikQBhvricPbZzNaeMml6X8rud1W2k1/1GgMsbn
         qS+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqMOpG04Ttt+4vqBl6VRfLdaeTkugcQGoqgxnB0NrvI4MDJRB2Dz69pBPI+3AxWi8rDop3CkvY=@lists.infradead.org
X-Gm-Message-State: AOJu0YywJN+ugJtE0H73Z3C/OcdOXEe3IVrqUs0KVw7A+opOy+jxd3Ph
	RxyD2a8qlhI3FpgAD9PAUDX0BuH3dwIklBKsD4SIB9VnbqPRM9gzKcCYuawvwqxrem9uiluhaUm
	bCcHGDxbD19ufKEdu+3ths6i4ezlWouVCMIavZLALVsE/cJJ9K3DpboPxcJ8co2+a
X-Gm-Gg: AR+sD128t8+dsrVwdN4QaxJGiaSDtL9xjYT/E8M2AqlJG1px1WhK9uwGQpCLE04pS8L
	ePotem7TuJ+cAEVqbxd1PiXN9vkjasVyUlHA97XTGiK60LkQW4Nb+FRSfUKYLDHgQxy5PZhxlLE
	g1RSKdMwmmavY7LESSoz6PmDsb2LmspStReNRfNU5pgwaBn6EQ8Mnf0d8lmaO6dDzNUwPVA3v/5
	Sn5CsIQ0WiT7jdUe/G221ShSXiFM+GDhfAQ+FX9wU8KIYSflmOE0jIzCPgjrve7AE9G9UOtatb0
	4xr9mQAFX2C3ILlQH9NxFbLYu1ts125fNsYHtDf7bRzUqJsTnKCug+HqQSsud81hh08DuTxCLaf
	PgL94BcOvKYYsmYp69GcbC4Gpg7f0hg88NEtl
X-Received: by 2002:a17:90b:4b86:b0:38e:a555:8fc3 with SMTP id 98e67ed59e1d1-38f2965654bmr8839877a91.41.1785166192555;
        Mon, 27 Jul 2026 08:29:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4b86:b0:38e:a555:8fc3 with SMTP id 98e67ed59e1d1-38f2965654bmr8839848a91.41.1785166192076;
        Mon, 27 Jul 2026 08:29:52 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm88728062c88.15.2026.07.27.08.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:29:51 -0700 (PDT)
Message-ID: <8ea62ed4-0a27-47f3-ad4f-b30a1317c800@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 08:29:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260727
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EF36MZvtAVfFplg1aaDvorjAsaUwAOy2
X-Proofpoint-ORIG-GUID: EF36MZvtAVfFplg1aaDvorjAsaUwAOy2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0NSBTYWx0ZWRfX+Ro68ZjGJZPC
 j3XDg4sZiINMcRSsYj9xT/XJOhLv8DyibgdWrg9alFMF6SNVCjJtXQ10uP5YinWvDEpIpy49paG
 P70xCSYtCuptHaYVMfpUO/lYQnXi5DU=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a677971 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=LjZE-VvXoyxWvIaTNqcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0NSBTYWx0ZWRfX3aHxytJQ7cRB
 YQQBfgEUD6jXySjT4az47NhsbY4oBZW8cazWFTQNpm7mOupWhB+m0hBFp8fZd4cJwtFC+PvlDZC
 QdJJ4KZBJPVJ7VskbBTwjDa1LpU3S2pjGN6LRuSR+fBt+6OWUH4YEHDmiuF1eYrzSW2FLAx+epw
 NTTz19aYoNhuOuKS+bq6fVTuCymimqPiQEl2zCSyjtyJe/2jwGq0SIo03X1qG+e9jrWdnZhGECL
 H6uhDLEXh+ZNrVNOJD9dvtrRgIKk+eQzAmnqeFbHRHZZwaOVojA52kR6Q5wrcpf4GZKu+yM5WSS
 yJ6c54jjadiYhzV3T97ji9OzqeQV200jEDBhmvyZpyGZwKhGj8caw2kIg1YdHj5NPtqHhmsSHEI
 jFM6oEqE2vVI8ksv60ogGOD3qAl2xhxBV9HXYKP5WWh9ySLm8FjanmWhjtzqfJQwhETyBUVb+aP
 nhzbD2s9snuuVzDjVNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_082954_933095_A2FB0430 
X-CRM114-Status: UNSURE (   8.46  )
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

The following changes since commit b24adfed83ae3fe623d978a30d5c6c636a874821:

  wifi: cfg80211: guard optional PMSR nominal time (2026-07-21 14:12:24 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260727

for you to fetch changes up to 469d7e6077c1665754eaf330e1feabdca7b060ae:

  wifi: ath12k: resolve PENDING ML peer ID from MLO_PEER_MAP HTT event (2026-07-27 08:00:43 -0700)

----------------------------------------------------------------
ath.git update for v7.2-rc6

Fix an ath12k MLO regression impacting WCN7850/QCC2072.

----------------------------------------------------------------
Baochen Qiang (8):
      wifi: ath12k: fix out-of-bounds clear_bit in ath12k_mac_dp_peer_cleanup()
      wifi: ath12k: factor out peer assoc send-and-wait into a helper
      wifi: ath12k: keep ATH12K_PEER_ML_ID_VALID set in ath12k_sta::ml_peer_id
      wifi: ath12k: add support for HTT_T2H_MSG_TYPE_MLO_RX_PEER_MAP
      wifi: ath12k: introduce host_alloc_ml_id hardware parameter
      wifi: ath12k: do not advertise MLD peer ID for firmware-allocate devices
      wifi: ath12k: defer dp_peer registration when firmware allocates MLD peer ID
      wifi: ath12k: resolve PENDING ML peer ID from MLO_PEER_MAP HTT event

 drivers/net/wireless/ath/ath12k/core.c     |   2 +
 drivers/net/wireless/ath/ath12k/core.h     |   3 +
 drivers/net/wireless/ath/ath12k/dp_htt.c   |  49 +++++++++
 drivers/net/wireless/ath/ath12k/dp_htt.h   |  12 +++
 drivers/net/wireless/ath/ath12k/dp_peer.c  |  75 +++++++++++--
 drivers/net/wireless/ath/ath12k/dp_peer.h  |   2 +
 drivers/net/wireless/ath/ath12k/hw.h       |   2 +
 drivers/net/wireless/ath/ath12k/mac.c      | 165 ++++++++++++++++++++---------
 drivers/net/wireless/ath/ath12k/peer.c     |  31 +++++-
 drivers/net/wireless/ath/ath12k/peer.h     |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c |  12 +++
 11 files changed, 293 insertions(+), 61 deletions(-)

