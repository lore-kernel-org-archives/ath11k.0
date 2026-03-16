Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82825F53D7E
	for <ath11k@archiver.kernel.org>; Mon, 16 Mar 2026 17:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EL8eRmWCbyxanJKOyEB/eWK8uBWGSkS3eehQ6T7GtLo=; b=411DCe+RFV2LOPDjZPTj/o+Ou1
	BSf7Qhrx6x08Bxq/WuEUAfdSdZinBsWTkSnww3CHSKKoJEHhDtD78NDJ8X2Uwq52ut953WTw6nc+t
	CfcpKM2tOeLH1y1BxiyCTqy09U23DezgvOKp0cB3lAO3SJGFZxtuSqzuJRvdUKP/3JyUxCp+vF6/V
	t57zN4dtpql9n8IlIvSG/rRQh5T5rsNjYks4OsOFBzc+Huz0VibZQjKzvxOjpxNzb0lUUwGBShtfz
	rujPYpgkI4ltbE1IgyeEOJTnHuyw2SzN7qGAd+osM2+wcU6HanrzzL878MwCWJdxtBe0kV/ccieu+
	JsUOANRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWd-00000004WL1-1bN0;
	Mon, 16 Mar 2026 17:14:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWa-00000004WIr-0zP7
	for ath11k@lists.infradead.org;
	Mon, 16 Mar 2026 17:14:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GEg6t43295186
	for <ath11k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EL8eRmWCbyxanJKOyEB/eWK8uBWGSkS3eeh
	Q6T7GtLo=; b=SI02Y2H8+YoThHCRZREkTRX2uEwCLNGPtJXcEkMrmDsFkI3IzUI
	vLtUIm8GJyTlFqm1wuptT/AUiGJiro7tTHHmIf7ia+g4oWOPw0UBCv0clZ2ry7Qf
	UkiLu8WSZG96cyJ2Ctp4IiceifpqrJvP5pk6M/Ay3CBMKVW5FAuKt5uSntq8r7dP
	q8cuSxPr/0zH2lFxg6mX0OZwPEsZwqBtFGAHp9WDJ+D8DZKuGHf+puR9DOREe8NM
	CPGROv3EolZGUUkLyf+gE/MABR/i84Kf0wyARVn8srvqkiEPb/yIIVGzk0JXyns/
	x0Q/FOOydLUBHpngdq1scbrNPrDEnGanNEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy0jg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd91c0262fso176550285a.1
        for <ath11k@lists.infradead.org>; Mon, 16 Mar 2026 10:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681278; x=1774286078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EL8eRmWCbyxanJKOyEB/eWK8uBWGSkS3eehQ6T7GtLo=;
        b=apgsC3l0HFuYvCM54QWsIsICTpCdJYJuy0mBEs6jIEcTIlVXBw4vLBHgTUusD3nPJD
         a9UU/Vp0WJ5slz1HOS9zRoDMUS987znIh52cPNYGcJFWbfXTZ+U+Lesn68hj/ebg/zoN
         d4QPO+FyPqMtQXwM6kO87s660EUTPf/78dTnKxnt0HTyTIqV7tnsfRN2UnQRRm+SD+fl
         7YAGF44YyF9zFoSKUszFmMXILhe/zXo8xUhf8RFHINKKO8ya41T1gJQfGXSsQYf+DvgY
         6N1QHR4Wjf2FdmCID1WZ4F2TOyGAsBdmwGU78RnGvk6SYNasRP1ivOu19VUC4oxWKopn
         1SwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681278; x=1774286078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EL8eRmWCbyxanJKOyEB/eWK8uBWGSkS3eehQ6T7GtLo=;
        b=hywh0zV2UpEMJRxLyDwvwJMW3UrydlD1RlwCAv41B1TshjrusxTOSopT1F+weKewCI
         TzL6OPaDMU+/EXT5QnbHw+Qi2nrdTRZnDGNAsX0NqH+RzSFNZemP9hKzr7wmv9TgPyEi
         ekAMO/oouYSLajh93lyLdfB6ZBelzjeIoU2Z28qKT7o7QS8zbojPHXeCg6j0jUffRbCq
         UhOLG5LGoDmdC/Osy44RALXpEUeVufkg3M3y7ngYffFo4Yc32lptLDx243dcsPVcD4k+
         YxyJEamux3cZq8MTiByeo+/mCbi0oEyKyiDlK2NSaWB2agvTvYnJAg7oKTn2fRjB+/Dh
         mX6A==
X-Forwarded-Encrypted: i=1; AJvYcCUeYRIIJ7+kC6LVas/jdGfykEq9W8u3qxSgv44eN+AdljNwaoMLKWu0WS76UG/GpC13D016EYc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLC10WJrlzUdlnNSPaz8VNGpKBPPLOL/pV2G1O/SSCGkMIK9JR
	iVmPlJaeEjAyx7M3ChLtRfG63E0juWY7QkJqohQ03JC6hPcGawnWzpQGXmQ0qZXSkq/5io/POAR
	tVDePJKQUnitw0eHNCF5IVguOP/sMNickhOHMkTSfayCEhArE2BhER4coPirDR/g0
X-Gm-Gg: ATEYQzyL5ue4/fnzMpu+6EGRYegPUAONM7XqObvDgrSFQsu9wDzs4ihF2qaUis3RLxv
	5919E0kq1q/8kloz6QvDZhWVhoeR2kfNS5BZZn++mDhzJu44RXcrr2N+X/DAdevysaiotZch1AR
	A1um1VqFyq2SepzYHTcl6nvu0TaHGzMwoFfRjqRoRQVgAKWNcnSglu1ukNhOMDDZn+LTTXcnazT
	qzeD1A1lXTIK/o/xfqC+pOu41nXO3xhIh2Hy3+wvv48pCCg9TUctK/23Gv5SymKtmzx/NvSpUiR
	+R/ACxQQ1Y5sDCtwJZotDq/0HbhZYGDU8k/1FZLWRRmoJ5jF88a/p+sRq+GzwoAjmlFVNmfM+1h
	neN7UBjyAg/pVSKGduaKgQBlMjwEVfjXEb9SXlJ97SsTI2frVfQ==
X-Received: by 2002:a05:620a:a494:b0:8cd:b90f:fc16 with SMTP id af79cd13be357-8cdb90ffcfbmr1273232785a.68.1773681278109;
        Mon, 16 Mar 2026 10:14:38 -0700 (PDT)
X-Received: by 2002:a05:620a:a494:b0:8cd:b90f:fc16 with SMTP id af79cd13be357-8cdb90ffcfbmr1273227985a.68.1773681277463;
        Mon, 16 Mar 2026 10:14:37 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:36 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
Date: Mon, 16 Mar 2026 18:14:10 +0100
Message-ID: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b83a7e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=iox4zFpeAAAA:8 a=ag1SF4gXAAAA:8
 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8 a=0T1-nGNzAKzEL-VDnLsA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y1Q9-5lHfBjTkpIzbSAN:22 a=cvBusfyB2V15izCimMoJ:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX3Kx/qPwCAC59
 U5IikqoltSlajm6FoPqIYgs7ziwc6hRrzV7cYjByL/MifH60FEDLQnLMmhVEem9UDt9HF6RpjaZ
 42KbTr2LkJYJq+CPbVW+1yOMkrTyTpLiokeULuLy624Vv4qzjycVYNQYFNHjNriRm9s9v0gEl7T
 UwdlBElg9zeTeVcqMW+n8v1m3h5wS/GgoVjJhnRDxuoTHQHGJKeoSbj2VZtlQnUxejz+XYYFOTQ
 m9kQpAmUbjOrzRd/psEzr+OzytQlIwduvD5UtPi6iJGm9mIJ3TLShjbN9Gml59mqXggeWOheUzP
 nZzI6T6lD0Jy1Gk2dU7MII1V5Uu0ON3OQhgMWt7/9ifhnf746lUOP7vvkP8LMlUiZaBQZJ0BIFW
 rWZiqGMotcpmTA3gWbq5vkkM6pFdQB0nWy+XW2ICX6PyyGutwGyXpPU2T6F2J63s01uAWaTAtWg
 2SMC/kSrMHojEdO37pw==
X-Proofpoint-ORIG-GUID: VjOdb7rp1XmiRjNRyAQUYfk9k0m-omkn
X-Proofpoint-GUID: VjOdb7rp1XmiRjNRyAQUYfk9k0m-omkn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_101440_396044_D1DB2F2C 
X-CRM114-Status: GOOD (  16.10  )
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

The different subsystems implementing the QMI service protocol are
using their own definition of the service id. It is not a problem but
it results on having those duplicated with different names but the
same value and without consistency in their name.

The QMI service IDs are defined in the qmi.h header file. Use those
instead of defining the IDs in the protocol implementation file. It
will result in unifying and providing a consistent way to represent
the supported protocols.

This series is based on the immutable branch [1] containing the QMI
service id definitions along with some drivers using them.

How a patch can be merged ?

 * Add the Ack tag and let it go through the QCom's tree

   OR

 * Apply the patch on top of the immutable branch [1]

[1] https://lore.kernel.org/all/abdkE2qWX5Amf5Jo@baldur/


Changelog:

  v2:
   * Added Reviewed-by tags
   * Removed patches picked up by Bjorn
   * Rebase on top of the immutable branch from QCom's tree
   * Fixed up short description prefix for wifi changes
  v1:
   * Initial post

Cc: Alex Elder <elder@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Jeff Johnson <jjohnson@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
Cc: ath11k@lists.infradead.org
Cc: ath12k@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
Daniel Lezcano (4):
  net: ipa: Use the unified QMI service ID instead of defining it
    locally
  wifi: ath: Use the unified QMI service ID instead of defining it
    locally
  slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of
    defining it locally
  ALSA: usb-audio: qcom: Use the unified QMI service ID instead of
    defining it locally

 drivers/net/ipa/ipa_qmi.c                      | 6 ++----
 drivers/net/wireless/ath/ath10k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 1 -
 drivers/net/wireless/ath/ath11k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.h          | 1 -
 drivers/net/wireless/ath/ath12k/qmi.c          | 2 +-
 drivers/net/wireless/ath/ath12k/qmi.h          | 1 -
 drivers/slimbus/qcom-ngd-ctrl.c                | 5 ++---
 sound/usb/qcom/qc_audio_offload.c              | 2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h             | 1 -
 10 files changed, 8 insertions(+), 15 deletions(-)

-- 
2.43.0


