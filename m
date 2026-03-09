Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2836FCA191
	for <ath11k@archiver.kernel.org>; Mon,  9 Mar 2026 23:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B6EMrLnxDVPfwOe2wdup+qGrSE+V3Jd0Vog/LiUHgfg=; b=yjTZwUj4MmSxGuKlDsO1sSn/v5
	5SRpeK7EDkdQ0GwKiTFxVkO9yVA0pPQxyzMuU554F/MsrgUl/hGd6q5zSjO8mto5nMs7ma2cc90WK
	D+S3iTgpr2iY75ZlDg1Im+AHnixLxn9TziVP4vIBfHqeGNlQMAo6DYWeonsiMZGblD4iy1YSV6Mc9
	lbzA+BpjU+db0cQTljLx9YhA6/qSxRquZzf0mjb59BmQTunzU1BzknTeebAwJwWLp25yxYp39o51y
	VJ0NeOgPPN/5LpSb8N3Tg7KMU2B7sG80VMcZdZ389qmPI7/sprclOYfqJZif/B7O+55VKSoSXHf7r
	sTwLJEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfd-00000008Gex-0CAS;
	Mon, 09 Mar 2026 23:05:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfZ-00000008Gc8-2Law
	for ath11k@lists.infradead.org;
	Mon, 09 Mar 2026 23:05:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC1Bo1298214
	for <ath11k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B6EMrLnxDVPfwOe2wdup+qGrSE+V3Jd0Vog
	/LiUHgfg=; b=TGAvtC+VhFmHdK/SB4QHiNUr2OSxTf0TIJZ4F0waDT6myOD0uEm
	TtQSwYPGD800TpfPWF9tvzFyFSMsm4U3ggXX0egFvddV7WK5k+1cjumsgvIIb08e
	d01KNa91jg8hUOmeX2rtwN5upjv3mFQk6m7dX9UikEgQjlQm/RTaxJqRnToWyg6d
	GuBF1d44869BgXB1QtEIIQXH4XUToPE8AJG+id4DXom4TDuhbLSjI5Xi6X5P6qWh
	Qu4GQ6h998ay0j0QNOK+GKhCKu+KWCUPnniJ1KY5TO5achSxfbvtkWOjzXQtcQB0
	KIYedqR/pV5hHJpYd+ZJ/fW6bUzG3t7dbsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv19nw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7c4ab845so959116485a.1
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097546; x=1773702346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6EMrLnxDVPfwOe2wdup+qGrSE+V3Jd0Vog/LiUHgfg=;
        b=OZPT2DVfbauAi2J6R10E7hVzbyn6qijuHH8NTQutqlaF6vKE0vmPlFueHiLw2u9npH
         53Ps+5y/RtJaBhUvNcXdJ10kw2UhfvG3r8NgH49ZgLbDCG2wb5j1x0Ja/4B0uen6DOo+
         xg2MZvu91jvmDY2OjEpxJUQBqcme9HB28srn/WHj7MC9yxDg3KmhoKnBoxDygHefOOha
         qPHJ3tOYlwtmyL53Kplg6bMPql4bHySC7S7nlVYCaWdOnD/5TteR2orLDRKtunLj+efQ
         wVYH+S9hjfmfbxhsg+WKw4fCl1lwrQ4P3HffpSuVRRExPYqODWbRP6xxAjsAV6eBKp9l
         t+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097546; x=1773702346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B6EMrLnxDVPfwOe2wdup+qGrSE+V3Jd0Vog/LiUHgfg=;
        b=bGZTKimKHbR3byv5vKNpFGAkb8UV7MlAWZF9FmacrxDIfjWTRUbLKLEIJobVMasZ7C
         MBnPAEHw9QaBRTxII7c28yStd26FP2N0WGsrB9xpMHUfxBPBXTRciU3nRA0Psg1eqo9o
         eu/RpNNaqJu7TBJnETMsrjagAiYV7AAqjkZE73L788z05oskhkKSouPbzvkhn9MV/uuL
         Bfoe+ylJpoqTUj7505qBoYEVxlMsBpPk4s1my8LEUPGmbbRe+6ZzOLOD0zXLx6PMXNlN
         bLXKAwrjofAIQC5GUN3lgiG7bY1lvRLpo5k29T/osfQA6xjK/vRFLisc5Ttl8cLChpXn
         B+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUEY/l4WHvcX3U1i1AeXyhSc+jGriebkEMq/NygzOrdVd3jV5oieduAN4EFS5Hgb23GKCNbLik=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx77x4tOXO92rfmiXIZm1p0B7XCkr7IgwjvuPTKg1iD3JWgzbL
	xiL1Tk/xcSKQ9G5xnfHKdLpuqo4mFE2tVvUXC5mjSGPajPvhFPasFluwlta44HRyfwPKKyWg0u/
	D3V5xXtbhy2yAfUeoUar2gTyz99DDS4pU9voI+rX6PXM0F/TQF1YZRYZsk7l2okih
X-Gm-Gg: ATEYQzxASVTh7jFRm2uXYOBe0Pkp1bNpN8cnNffTb43d/u90i+GxuErHXT6OFrtnVCU
	wMhUAmvkS44y7O9CDiILVAvYQqYOvXM0jhVteieRI0ytaaw2oXp/GrsGq5SMxmT7rkC3n9TRks+
	Jcka+MqpBIOqvgtPoaIoL0w3TI4bdle3yH4/CRaT9bsYChcJS6fPSxxqejaluQRt+PF6XC1lGJP
	7zwc7OsdEMwJArdudAQTK8r9eHW1JipU5gCE0y2gn1U9e/LXHOOe3THSAGZ9uXntmIx55rx2Fsd
	CYzw9TnHJeYSgM4pnA9nDs71J45aBdC/SlqfaV9fAesD827Mf8bO6UK9dT2QgVOU0jH+gTMAswb
	QIDBBjPDN477kkb8UwrBQHgN+/IoguxLUGe5uEACBhDFZl04C5Q==
X-Received: by 2002:a05:620a:26e9:b0:8cd:827a:2abd with SMTP id af79cd13be357-8cd827a3706mr628589585a.72.1773097546391;
        Mon, 09 Mar 2026 16:05:46 -0700 (PDT)
X-Received: by 2002:a05:620a:26e9:b0:8cd:827a:2abd with SMTP id af79cd13be357-8cd827a3706mr628584385a.72.1773097545862;
        Mon, 09 Mar 2026 16:05:45 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:45 -0700 (PDT)
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
Subject: [PATCH v1 0/8] Group QMI service IDs into the QMI header
Date: Tue, 10 Mar 2026 00:03:29 +0100
Message-ID: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yG3wmS7cM-ihkanpFn5UrUUya4Moq0nk
X-Proofpoint-ORIG-GUID: yG3wmS7cM-ihkanpFn5UrUUya4Moq0nk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX4ri41DZJZecq
 4ZH3ogPX9bqg2XF5dCnvtNrGO5k9FmGOBKzqQInim4M+V8oqL3gZEytoU2mvDVagrA/8t8XfRbc
 J76bnOLk+1VOwOqPTZATVrSGwlhkNuzILexnB9vtnhkHpRSJmuk0WrXwuOh3pkWWRYww1JceUoF
 H2mCKFHA0xspJqn7QIJHTNU/TVcLd7WDLuqrpH1t+q0v8gZuMbL7W6HLGORDUr1ZqFR7nsjjawn
 YIPj+TvWHMgSHOkE0tnM6KXwnelIhqsAmza9M5RIQbJmP8dDN+ZTyTFRbi5+aWgwQ14fkNi8/j3
 R58yJ9jTrv+Nl/vE+BrzuL0+Ft65M5S7rHxX8lJ3MuBUZAiDjG1jgJ1/ljpfsbBJU0HkO0aALiS
 erpGK14/dl6bdSHapN3pVxJavRVTXSMDeuXy6gVR6f8i3MUp5Ka9/72vMzguXoCTOxL/WQ+NnOP
 XGD/GegVziQWupPmXpA==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af524b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=J1Y8HTJGAAAA:8 a=1XWaLZrsAAAA:8
 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=iox4zFpeAAAA:8 a=ag1SF4gXAAAA:8
 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8 a=yGX2isoJ_2WtN150yl0A:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=y1Q9-5lHfBjTkpIzbSAN:22 a=cvBusfyB2V15izCimMoJ:22
 a=WzC6qhA0u3u7Ye7llzcV:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=TjNXssC_j7lpFel5tvFf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_160549_612450_42D91EAA 
X-CRM114-Status: GOOD (  14.85  )
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

It makes more sense to unify their names and move the definitions in
the QMI header file providing a consistent way to represent the
supported protocols. Consequently the different drivers will use them
instead of their own definition of the service id.

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
Daniel Lezcano (8):
  soc: qcom: qmi: Enumerate the service IDs of QMI
  net: ipa: Use the unified QMI service ID instead of defining it
    locally
  net: drivers: wireless: ath: Use the unified QMI service ID instead of
    defining it locally
  remoteproc: qcom: Use the unified QMI service ID instead of defining
    it locally
  slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of
    defining it locally
  soc: qcom: pdr: Use the unified QMI service ID instead of defining it
    locally
  ALSA: usb-audio: qcom: Use the unified QMI service ID instead of
    defining it locally
  samples: qmi: Use the unified QMI service ID instead of defining it
    locally

 drivers/net/ipa/ipa_qmi.c                      |  6 ++----
 drivers/net/wireless/ath/ath10k/qmi.c          |  2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h |  1 -
 drivers/net/wireless/ath/ath11k/qmi.c          |  2 +-
 drivers/net/wireless/ath/ath11k/qmi.h          |  1 -
 drivers/net/wireless/ath/ath12k/qmi.c          |  2 +-
 drivers/net/wireless/ath/ath12k/qmi.h          |  1 -
 drivers/remoteproc/qcom_sysmon.c               |  2 +-
 drivers/slimbus/qcom-ngd-ctrl.c                |  5 ++---
 drivers/soc/qcom/pdr_interface.c               |  4 ++--
 drivers/soc/qcom/pdr_internal.h                |  3 ---
 drivers/soc/qcom/qcom_pd_mapper.c              |  2 +-
 include/linux/soc/qcom/qmi.h                   | 12 ++++++++++++
 samples/qmi/qmi_sample_client.c                |  2 +-
 sound/usb/qcom/qc_audio_offload.c              |  2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h             |  1 -
 16 files changed, 25 insertions(+), 23 deletions(-)

-- 
2.43.0


