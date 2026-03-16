Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41761F53D78
	for <ath11k@archiver.kernel.org>; Mon, 16 Mar 2026 17:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=CsEi+6lkDYNdQx1BcAMw8AIdQ8
	yNAUfXw9ByaVUoE3uW6NBie78xtqZ50ud6fOsK/2HzsJQv/GcduJhRL65sk/9qf7DZSosT9Vf7XDY
	UKRduKpqkplSyFaKqoUPnSxrSvT7HDNy+g86OyT1ot3pzoPGLaNdkL4+kkRU1nlMv3B3Z+aueiY+r
	cMLynWUxa1EynskgzlzjCN7NoUA9LT1T6vCpOO4rcaFZL4yMNopZsJ9LfJtBWAUEb91MkouuvzUc6
	llaUx/PNQ8rZhUwU9Bs0qmAWib/8XCG+/4T9ZWVG/KWc2xy2mPys7VMF6nDxMoxVYJeQrsk4MShit
	KAY7K4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWi-00000004WRG-3vJw;
	Mon, 16 Mar 2026 17:14:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWg-00000004WMy-1MUz
	for ath11k@bombadil.infradead.org;
	Mon, 16 Mar 2026 17:14:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=SihjMcq8II1UGoqqsG+kAPuqhr
	/9cD1asbllFaPFMJb78lHcrPRDOFbMdQhsfCGrQTrtE2q2HQOpF5Ex1bHlxZbLIe3D0fgTPH5d9kb
	jwVOklPUhPUoG9tM3OL+fQNjRKMnRyFtv+MHo7iA0TrM50/n0Vslasb+OTVCcyE0zv9jygBiKbyEQ
	8h1kANwNpOWeiJ9IwCS6B3SmgoGXrFYhtxP/xe9wXsE85jPiZ7wsiImTD7I7LpjSEJlhqV7IzIeVl
	rr13+VPfgse7kRJYDX5yWs0Q0/PVCVZs4SQcxPKzxd5orXgAQsclHIAAIiTUnftYcOgmxgvtAlEI8
	EmM9ayHg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2BWc-00000007INZ-338O
	for ath11k@lists.infradead.org;
	Mon, 16 Mar 2026 17:14:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GGMvmL3101985
	for <ath11k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JbLYlc4Rhba
	fmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=DVsSgDcAKCTmEeR7blNUSxx/K50
	JpPXUhCOYXuK+aOwWkb5J5g+nEO9VT5fBX+8A+kFJiHfFYkae5jwOYz5xd2CDh+W
	zWzlQF6DjO9E+VAB5xGOEffGRrA7NKQsskBhnMhFhHMWdfJuESNFY4Awjhn5BLE5
	Z4zTDfL76Z1zQIRWnvwqMMGyxsEC2N7hYOU/0dATVMbpUIp+jxJiDr9Hd4uYKEmz
	GM1CtzSl9SJFqEuMBjmcv/KQhuJd/ANnR1xDVCrhJZPGDbk/16T3S+JSiMEYhnpN
	l84P19B96VJeN03VrJOLe+/Mz7nd3Yh2LwAN5/yGySj9hWp5vN0XahRUwNA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb786je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 16 Mar 2026 17:14:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509007aea22so166246711cf.0
        for <ath11k@lists.infradead.org>; Mon, 16 Mar 2026 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681280; x=1774286080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=GH7RX2x0a/fAYkJ6HbLnOfBzd57iOCkAwHZ4Wxj8HCgD/JSHF8EYB4lwhRjo/NqDe/
         1wJVutxl/FOFuHadpe0i+bbzDb0nDs4z5GlIxSAbu51n0CEfHvre686CyX+sZwp1PkJB
         tPIslYq5IEToLgz56GX5m8apzz/cRY6UHHdJLTNW2weyNEHAo7G+tgFItOFeWVsdeblF
         Lk7LUnJi4qTW9x9yGZS2vGjwTCgH4Subkp6KlfZ2Rv+rR5l6LOxHqJZi04lqcd56uH7n
         3P6ipWBsJ07bqWhIhVe2sklrlxqKW0tuwlO1UEGU1iCl4yAzOqZDVDz98Nbceq8RVIBY
         jjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681280; x=1774286080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=JI+cq1CIlQLfEAwq6M9vg53uUGhfQ1C1iJjHFVdhLn2Si+ASse3U454054XmIe/6Wh
         K5ixpc3GrHmK9s3yJc1U4vQIZz9dEq9fldlJX2r0uZ7FUOS5AAwOPYUMIWZG0JgV+IY9
         /ts+3AnSEuCkZP5hMsCfaywAM4GySEoSDzKW46CAdcR3PXdaX48/7vDpLbP+3Mkqmc/9
         Ww0y0Y5rmtw6Fuc3BkUuWYBvsH6DOoXvhq0z3ZGGCfRkR9yOErU6p4xGURBMm3klLkAP
         7YvmUhCiqj5ly16O/Eqcuww4hGNoFDJxc+vNrV8yvroLnCKhP20G4A8+OsnBOzB1U+Jl
         8oJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFAT8nGvo8VdtcYecy/c2v2PkrZQv433tCcRXK7VnVTaatlfc6p3OgAjA+bPbiRuH5ADcal2s=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBkJyeRSBoCRQDU21xKyGSPJHKr9mvKzzSJqdT3FLnGxJmmq3h
	mCG/bDY6ol7ETzoKv+y9Js44rnjOch0z1ugBcA7WysKXlWURTCQPOKUcg2YR5MiHO10c9ARM/gI
	b8v4yNDuwOAuyTXM8Ur5Ri2BRElZ7XIcdE6/pjCLPKQzubqNpuKaWz5DfVH4Z4fK3
X-Gm-Gg: ATEYQzyL4Kf5vltaR3UDzh0HC7tieowXou3lEBdWqNWagvGsGIFe4CYfOXi9AVEr6vF
	w3pmOUc3cT2MXmmuc4Meb+CP71m2hFCqTq+b+p8/Snc5s4Y7DvmybP4e2UkzKW+1nC79RdHi7MM
	Xk8aqpoigQdbmK/PjZCwCiyve8pAMcfKzHe9BoKjAdq1qrhEwWTu0vVyyBW92QYC7Njc8EdNibO
	L7jDqRUi1XM0tlnqQDIiN2xDNWgbyINmmLwyCXh53x8ZJ6LU2hc+lICsLNRIcyY6qaTSjbodQce
	B2+8hNcIASxTfbRl45NYfIVpn4q3SbtyPmNj0YzFzp9gHLO+SESFKU4lAwiScKndMI4S2ZtP0Nd
	XYi2EU2pKYp3wSWbBPGFvci2dRVEXNoCNJ81aycPqzR+fEbqi9w==
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859176885a.49.1773681279599;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859171685a.49.1773681279092;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:38 -0700 (PDT)
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
Subject: [PATCH v2 1/4] net: ipa: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:11 +0100
Message-ID: <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX/EftCfTzoTgm
 Fc/SKGDNRFLieC3gUBKb/Fpo9cFiQBGYQS1vrfvpkpfcoRSQer6x0cGJsviLSnE9v9l7aX1ASgp
 Ey2igUhLbY71Dq5rZHpkLyhXmuHHkVSB4NMZ87sLmIi4PuJ56B+9PlrVplkBEMYTrr5N6jEgfFA
 1oYEzye975jbrsoVWUpBY7glKBO/aQw2uw+/udUdztJnfYh9QAQOjD8bNCMTqDA2163VOyNqbHY
 4Kl3TKjRuFgkWTE8lwnEfT6SR5lq3CehoS38YMXgrY+szGZGkw5ui+8UOONeUMKDJVV54Rh+vmM
 Cbb0AnTWJTT6QuqLIADvBMJallHpHcVwj1rxGFkYb/j/3xl4AIC652Cv/tF4FhhGcTnyR2n8ATn
 BvLGKb0FzTrWI5814a5Gj7jknJ3hussIMcpz4I/wUEg6t+n3zFDVipM7JaxwESfTYcaz1axTkEy
 Lz/77ofrDrKUMSe1uVg==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b83a80 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=shTvKy1OFHrmHVGPjj8A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: dq-3O1BSptG6Zs9gHUhUK5tR1BvvK4Uh
X-Proofpoint-GUID: dq-3O1BSptG6Zs9gHUhUK5tR1BvvK4Uh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_171443_160393_C375A407 
X-CRM114-Status: GOOD (  14.01  )
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
 drivers/net/ipa/ipa_qmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index d771f3a71f94..37936ad132a2 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -66,11 +66,9 @@
  *   determination of when things are "ready"
  */
 
-#define IPA_HOST_SERVICE_SVC_ID		0x31
 #define IPA_HOST_SVC_VERS		1
 #define IPA_HOST_SERVICE_INS_ID		1
 
-#define IPA_MODEM_SERVICE_SVC_ID	0x31
 #define IPA_MODEM_SERVICE_INS_ID	2
 #define IPA_MODEM_SVC_VERS		1
 
@@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	if (ret)
 		return ret;
 
-	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
+	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
 			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
 	if (ret)
 		goto err_server_handle_release;
@@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	/* We need this ready before the service lookup is added */
 	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
 
-	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
+	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
 			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
 	if (ret)
 		goto err_client_handle_release;
-- 
2.43.0


