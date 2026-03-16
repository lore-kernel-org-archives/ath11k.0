Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F63F53D81
	for <ath11k@archiver.kernel.org>; Mon, 16 Mar 2026 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=; b=i2OHkmmd3DubJmnnWXXig/PREU
	HwfeSfgbVvqhtXF1FFFGQdNzpH7XJuLV0N7p5jCpF40T5Oaq362Akwr8PHtU+x7979Dv06tp7WeCF
	CYseA/ua3oU+rlMQXmifZJLOYHSlG1mgW2oglLSugpMhs9j+MuUUX4ue1RImYqOhUeVfWYcQDaqv0
	pFQvLNoBb8WgSWVLiW8W0+SgFzSZvedtp3wheEb/QlLriT9IDcN5JFgI/a+z1aUO5m5BJVqicFU2l
	KwWZhWiKWIyFA9m0GZW7hM3+0E51vqtbsyigGixCUuM/jUQhmRQdT0HJxDgNdbXvxS013JefRL7qb
	cvLHC2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWk-00000004WV3-3hzM;
	Mon, 16 Mar 2026 17:14:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWj-00000004WQs-2s8B
	for ath11k@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=; b=OG9vlkklrEiH8/ewNeSJbeMR/k
	RhaqwOlp/SUcwx4Gjb/wHY/+4apyH737OFqXUww2IasFqk6YoaRhDv28xSRbv6OPo3vJUYjwP0vrL
	076ljrxNUi6/j5xlHdZkypmo1DlslzKs/CU7ss2if0xJ8/K9Tvt8eu9unn2AL5qS48xWjNMmTqMsH
	GBaWEf7LrOXrUg072yJSy1WLtV0+KxenbPXH6pi8uQzLgDspWy3a1jCKm/810FZpTUEWSqK88+aB/
	8S4ZIJQlm/ssyytHSW6e50vmgBSwmgYmDHCTfaJStHmj9NDEKC2w+6cbugQgve5HzPw7xU35lj/cD
	rV/KbGvA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWg-00000007IQ1-1b3R
	for ath11k@lists.infradead.org;
	Mon, 16 Mar 2026 17:14:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GDcWKV041517
	for <ath11k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WFXy8rqV6ZJ
	yXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=; b=P3DU6dl3c9C+mKOoFj8fLnflTRc
	E4S7OufGIBneH7YqP+NWIVKQr0JamAB0ccP/h1Fu1YGnyp4csg0npjgoFeixW8JR
	Vxl/OXVJfgmTwzF4Vn7J2fQ1stksLuZyNanswJjCeX+tEvcw4wn+3J9ef+QTeG1n
	nsaaszMiZ/kCXgERsFktG+NFb0XemxxH757PA/JfVm3NnNUUQzrGnDx49KGDygK7
	pFlzs5B2WwtrEU11sYGr3Wy7XXdUOW1/NAVcRbrPi0lKxckc1uUQdMkQ34QJ+ljV
	4HrjH64gyE1cItzRHI72edpT4EBGjx60xlN9Izp4/hJP4ItIfIEv51VQ86g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt82631-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd820c6a4fso4310835485a.2
        for <ath11k@lists.infradead.org>; Mon, 16 Mar 2026 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681284; x=1774286084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=;
        b=SZWD7onikZrfqIl0umGEylR61iJXsOgc6Et97KgtMcnOvZL7ZUWCy4PzVDr2Vvt96Z
         ggKHPCzuIOE1bd4w497Ndh2SdaaDwWUKfuhQ+F5FOg21FVMCHelBhvHIEmroE/8R+/0K
         Hv7a35KSpFnYj1KDeqEyx0wpO4a0csDt1IZlP6fvcl/a9OfWS8MM4LXnML3Z3tNeiGl6
         8zF/FoSNkwkxYZUkk5QITFPA8Kq39UGiznkdjvj5BCzf3uFNUTmsPnH2QBTGffxlbaq3
         9lkUdb6A61/hfvtlBlmuI2ukbRCNsVxZ/bWdUw6fFcnAEJwpXQ/pHZASuphMGHqk1TaY
         wBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681284; x=1774286084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WFXy8rqV6ZJyXTmDCC1XrXB5vrLD+ozr+xme7NcdKiQ=;
        b=KxI3/peLvOk3iBN7bapw2iG+vRtv84+Ocp6GYT2Rm4Wf6H7b43gL393RqXxbJUCgw/
         Wn1iwq6xsAYfjdhGeB33XFdmzSNp1DcPBzeEhrf3CvxQ3Ie3maIx4eiKcagP77IqNQtd
         98pwrdE8Ie07yTkDwqOA/k4vAhEIwjwUmGP/zyyR7/fhxcSnUomrNr/R5+g4UWCr2go2
         a4mWS7a85wQhiYiq29vnwrIHm60jzq2TSgYPg9AV8aHBCteOLug1guG5oekj7BiTAohL
         fb6xGcNZAY3AEMy+nEiSJGnBRiFH3HZ/xiDWF3hz7L/sdQHKzr+xFeS/bHidJje7HAFI
         ECNw==
X-Forwarded-Encrypted: i=1; AJvYcCUWldLCmrjund7Mbg/LN7wAQjL3lpik+M24JjKVkxnG8mfE3saRqwbOsxVK+mcXtAVT0h6iIgM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+gNSzPs90MmD7Uwwy2YeFprJyR3tqfAH5cOlKtqKLUelAegyV
	ptpbyoRorFShlmDRE5hHAtQ2BftMLRklBorpRKrlqkDjb6cI36+/dp+5sls7l2tLdu2HubfZzX8
	zCYLy5jRA0Y/uvXSoAiML6AKkvUNG5JjQcEuAfIWNW2GJyjfhrs4zIlO0sgmYxkSC
X-Gm-Gg: ATEYQzyZZ13JchdOSpTqOyk2C2h7Laoh8o5ur0qz0PIDs71h7fYOQOPmwtaXIZm7UhW
	4kx7y9mlswUalW0dvG4JQMaBTup+oP/8z7o4L2Tca9X6xE0/1aNY6Rm8fqgwM0Lhx0AM9TQCPyz
	TwDxaAOzMe3fhI4EzZiQW6izz0MV3IhszOyRrOJt9d+hPsFFHszeM/Tx9RvFEGIjAAMXJdK76hf
	OoWf41whgCQ0moRzBzzvtyKBwQahJgygyMpwUsInoAAntvdD3mZCrgHmuaMc7A12Qb5v1mBWFmw
	K7C6GFk8nSLEYjT1rBkPGd0QABEJTFUt8TaDpn0qLwL48btu+stZnAxQ0ddMtzyrV6wRLXPsOst
	E5KKuayEFL+Z5/fFLa4HijVqsDdR8NsO+oN0YDj/UYQf9kQieqw==
X-Received: by 2002:a05:620a:711a:b0:8cd:b3da:5b5b with SMTP id af79cd13be357-8cdb5a4b098mr1839478585a.10.1773681283372;
        Mon, 16 Mar 2026 10:14:43 -0700 (PDT)
X-Received: by 2002:a05:620a:711a:b0:8cd:b3da:5b5b with SMTP id af79cd13be357-8cdb5a4b098mr1839472185a.10.1773681282736;
        Mon, 16 Mar 2026 10:14:42 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:41 -0700 (PDT)
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
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 3/4] slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:13 +0100
Message-ID: <20260316171419.2619620-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kY7BmMk-vLBIys9Hoj4XQs9uLGKc2-V_
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b83a84 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=PhtMypRRY1SmXJO8NnMA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: kY7BmMk-vLBIys9Hoj4XQs9uLGKc2-V_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX+qKQNNyyQkOF
 ka2Y2cTh/pZISBKmIUNGj4IsAuZ0KR0YS0ThHuYBlRU8TCXoqGQ2MdozmAbDs14pthgcXeg3ott
 aJIOhExzp/glQSeuNWF7gVt8Il6fNTCMpED5RCPyrZvG1iXgK1R4+KvT/Cyq3RHTQnAuy0fy9SO
 HK5VzIIH1t3b/7P6wW6dOU2QpgjAkttAu4z8mdQDKUaBae6hzNcD6SedQMrgVq8+PI+KeDN0lsv
 3IMA3cXvtp5y3UbUhQULlOq9oJUiXhG4l/Gf0DUF7CXh1P/d6C/24Yz/MBLqn2AZVW4EeaZqX8i
 X8LnBtZ0dvtaDgTkltLpIfaTltr4h1Z01gFDfixnvzgg+IXyAztTezaItwMQDBzZhXSPFQyO28f
 cADLE5kkBryy0DovXsLyV36f8TqEzT5YOngpgLP4xGeNPx+lDRq2qLkqlXBJeNzry66VPdFro8k
 8VPHd1BtakPkxa/wHRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_171446_739960_C3A3299F 
X-CRM114-Status: GOOD (  14.03  )
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

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d..0b88b8577bdb 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -48,7 +48,6 @@
 				NGD_INT_RX_MSG_RCVD)
 
 /* Slimbus QMI service */
-#define SLIMBUS_QMI_SVC_ID	0x0301
 #define SLIMBUS_QMI_SVC_V1	1
 #define SLIMBUS_QMI_INS_ID	0
 #define SLIMBUS_QMI_SELECT_INSTANCE_REQ_V01	0x0020
@@ -1408,8 +1407,8 @@ static int qcom_slim_ngd_qmi_svc_event_init(struct qcom_slim_ngd_ctrl *ctrl)
 		return ret;
 	}
 
-	ret = qmi_add_lookup(&qmi->svc_event_hdl, SLIMBUS_QMI_SVC_ID,
-			SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
+	ret = qmi_add_lookup(&qmi->svc_event_hdl, QMI_SERVICE_ID_SLIMBUS,
+			     SLIMBUS_QMI_SVC_V1, SLIMBUS_QMI_INS_ID);
 	if (ret < 0) {
 		dev_err(ctrl->dev, "qmi_add_lookup failed: %d\n", ret);
 		qmi_handle_release(&qmi->svc_event_hdl);
-- 
2.43.0


