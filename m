Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC98FF8865
	for <ath11k@archiver.kernel.org>; Mon, 27 Apr 2026 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nILNB2NfkxRGoIS1fc1qp2JXSYpJLFP16z5zIuaSkNU=; b=g6sdBmphKir4tCp63/Wuzb+xSx
	I+l3Bo/JgkwKJd3hHdl6OQCkcWpOdfcVmo73N5wORIVMkDKYB15pMAL4kSpzxIGq4LchAll+2qc9I
	7eYlw9G4d9crRPcM9J4trap9+9SesipFgP67GdKE0PqCIp4EGeyFlETRIUqbO4y+aW3Tn2x+1dfyo
	3nPSLDya3D6zuYRlQU8Ymr1QWfEjDxvDE4A1GeOK5Ud7QM4PTRaf8Et5KNzy0bLbtqjmJiuCAyeAL
	ShzurXjsXwf0EWn/7ic4GP1k21eR5p+8sNt0S5lqZcKMUY4OZH/vl5KoyiuCRYYfGslSegIw4Lej7
	cSdl1Xvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMX6-0000000H2p6-02PS;
	Mon, 27 Apr 2026 14:01:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMX0-0000000H2mq-3teS
	for ath11k@lists.infradead.org;
	Mon, 27 Apr 2026 14:01:54 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDte9r241086
	for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 14:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nILNB2NfkxRGoIS1fc1qp2
	JXSYpJLFP16z5zIuaSkNU=; b=H0hbbVxgLqait/8cAo16Pjys5o01mh29ilPdb2
	hdaTjtYbbpV5oZcHNe66kjrEmjf+GtxUnrUj01OSWwnk2PyVdijk4FmOLr7dqez4
	JJR/dsbLAFKDQsib0xz9VXHEBjB0x/rsCTjbtvCLBQOCUg9DyGuZKI8mo5eoEZBP
	OkAfC2OHUNcWg1qvAmPDmPNENpWCd8WqE1XemimTC4saI/nFQageBpLcb52lmQMK
	Q+o1R2gPEFJV/AmDF93umW9SUT+90KF/8FP8AaLjRTUqJJwKogZQ0A4Ou+APoUJ2
	4sU/ATNjFCE5XftvZTbhgf7E7AGWwR+ArwE32snC4UuH1+wQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946r0up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 14:01:49 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso13015989eec.0
        for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777298508; x=1777903308; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nILNB2NfkxRGoIS1fc1qp2JXSYpJLFP16z5zIuaSkNU=;
        b=Is9Q+q+rc0T23WOcKCoyVObOx7dAw5AaMdfopRm+qJdnchAcLJ/3HM0irhL4hypkhe
         xrvUwknkUBgU8raKPsspB7znp45KV37LhD92TXCFn5LmQK/+XvfPyS2nNRDsHWHNPoIS
         PZ1H/g7ZWcHoTVF6m+hJwLHTqhPDzwjWWIRzrRhUw2o3Sh5nJQu/vi0ENPr+u7jNOedQ
         V9LD6dEHW0iXGomZMwsN01cPmK1QRnw52avErOFDHkXDyvICe8KMk51AoSXCN7oQa6RC
         SdTSP3UQxFIYdeBVKgOtc33HIuSBS7Q6jHXb8bn9SVC8tsOJ4xSBeSjr7Lwv3O8Gde8p
         OtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298508; x=1777903308;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nILNB2NfkxRGoIS1fc1qp2JXSYpJLFP16z5zIuaSkNU=;
        b=BfGea+Nv0IJEkGfjpnSQQNsGaMWHwUJECnxnH6coyKJTpmVNOCPU0peUNrZnb1BTN/
         VGxe2Rk20rK0PC1T+1VaZT9Nln/A3ucc0kTdg+qvdqrq4ax6T6AO4UBD0YABluRjENPt
         cJTZkacxmMu0Z0erpI5J/yIvyH1S1+qojNNQ+HBgNR/ksAXAaXwaP+12doNodNw4V3uz
         SzF8iDScc/kpLg2WIzbxCmNHbunzrXrAcA+uDPm1JC6fHwd8Z9fV3/k28tTYz/UeKRof
         libJ2ONfB+ghNe9RyZv+nuPSlRbrpIIwknx3PWrooh/Xlxwa5k6DrZe1FPGkESgixjyD
         d3ig==
X-Forwarded-Encrypted: i=1; AFNElJ8u5rtILpdxNWxeeGaLD5ZfyF5P+ago3RvnAh0ukWCBpr8k7thTXkELomBuoFDfK01fSRnlIes=@lists.infradead.org
X-Gm-Message-State: AOJu0YwkQPLHVaLC24wPGx7R0kXQs1rIRz+z7hWMVUQJSqJ2lxCqLo00
	OPq4Oz6wM05mYMGzYyfQwerH5xoKgi5czsMG0LutfXcQbA7CtqVUqATxZHftwn70yBOd9qCsLdS
	UKWljLHmfthYfHgAppFaB2dQNThwrPqwfNunPhMzFISLjXM1tKi+sQcmypPXJWoZm
X-Gm-Gg: AeBDieteRYt8DHI8f9OAOlW5l0g1kraAmKZG7JEpyhovfHdRO9/1u0LW+cLvQVtwvc2
	QpK3j7Kkdxe7fMJAxXJpTSS5aNOhA7dDVRguy938+dggpbJo+QwDkbau+WpMsLXzGGxk8tt4dvU
	doPmzG5J43cWi62TzhOkDQ4SYnbqqNdWMFGiXh6sJfkx6J/Uz19Iwmed8jGonCBiGtZQUgLxz6c
	utU6oTjFs+Q1y1AwuiAxmStgh6emd5UvhEpritEVpjyZ2PyboJM49F4vFMosW2T7zH7go70Rbrf
	UJkKJmEOaizNcncvjDvnBsVcFWO2Tgxb3RckIgncpJWwhYlVP501dTlRtuu99r2hNiMwr4Hswqv
	pMouyCtwLurF252Yzkhd3AruIpYlAinC65hgJQsgWhinUawwiDwLcCLvOKjE4Si4xkK0+
X-Received: by 2002:a05:7022:321:b0:12d:b654:8171 with SMTP id a92af1059eb24-12db6548357mr14649834c88.1.1777298507820;
        Mon, 27 Apr 2026 07:01:47 -0700 (PDT)
X-Received: by 2002:a05:7022:321:b0:12d:b654:8171 with SMTP id a92af1059eb24-12db6548357mr14649716c88.1.1777298505647;
        Mon, 27 Apr 2026 07:01:45 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc6f08eaesm19806512c88.12.2026.04.27.07.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:01:44 -0700 (PDT)
Message-ID: <411dfb79-9449-4c7c-af0e-d9d1dc81f3c6@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 07:01:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260427
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69ef6c4d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=9dYn0W3-_-pxAYNLL-kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: eTCU4YK00tkf9ltI7bjVXWKtl5mDnC7S
X-Proofpoint-ORIG-GUID: eTCU4YK00tkf9ltI7bjVXWKtl5mDnC7S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0OSBTYWx0ZWRfX45nm+iQtQSQ7
 gPOPA/93lj7sB4VKEX0ZFMsrcUjUiGr0eLsWANCDtLIq4p3S2D/9Dl2XLO8E33RpboL6NFm2JsR
 Uu5OHZ/kb5qAt8zToYw1f+M9ROWs0lCh8ZWzmcS8ywyo47rBYipfz1/4GBqo6sj8iPrVEXRImRe
 7pV/0F7O6ydGV2YeKnCSp+eRgUUqqPo0UJ21ZqAWNw8CQrDoDcS9ja60NGvn5chp2m6MCdGt7GO
 uXApcEghp8lH2jixZ/3YVU47g0xJMshxv9ixEDCsF/12lt9LhBuvDfN8VdM7EpWKGi8pxLDda5X
 jWrtkXr3kA6u6hnM6ffpJinJiQElhGEok11L8PGq/IUc4bhUSzaxP7/c/Sw0WR4s2q59ULy2f6j
 X4+MlZxkRXuAvWLwWWxWaJ/Oomza6Ls6TqxySy4W7y0DmssdI2PjmjJnxPOotKuCUL9YZt3WURN
 si30WpEIJcgXf5oc1OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_070151_076447_12EAD9A4 
X-CRM114-Status: UNSURE (   7.96  )
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

The following changes since commit 1f5ffc672165ff851063a5fd044b727ab2517ae3:

  Fix mismerge of the arm64 / timer-core interrupt handling changes (2026-04-14 23:03:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260427

for you to fetch changes up to 4498664e2d5888efabb96428196a926acdaa25ed:

  wifi: ath12k: use lockdep_assert_in_rcu_read_lock() for RCU assertions (2026-04-23 10:57:50 -0700)

----------------------------------------------------------------
ath.git update for v7.1-rc2

Fix an ath10k build dependency issue along with a few ath12k bugs.

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: fix OF node refcount imbalance in WSI graph traversal

Baochen Qiang (1):
      wifi: ath12k: prepare REO update element only for primary link

Dmitry Baryshkov (1):
      wifi: ath10k: snoc: select POWER_SEQUENCING

Yu-Hsiang Tseng (1):
      wifi: ath12k: use lockdep_assert_in_rcu_read_lock() for RCU assertions

 drivers/net/wireless/ath/ath10k/Kconfig |  1 +
 drivers/net/wireless/ath/ath12k/core.c  | 77 ++++++++++++++++++++-------------
 drivers/net/wireless/ath/ath12k/dp_rx.c |  3 ++
 drivers/net/wireless/ath/ath12k/mac.c   |  2 +-
 drivers/net/wireless/ath/ath12k/p2p.c   |  2 +-
 5 files changed, 54 insertions(+), 31 deletions(-)

