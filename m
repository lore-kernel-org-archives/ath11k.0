Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F41FCA19D
	for <ath11k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=; b=dh4ExLCsIlMYYXy9BSEA8ez7L8
	HK3828bzhTe/8ZnqS43RqDfbdNamAxEHY1P8d5qU4+XdBMqKlteMBh7+8miBuDuCn8n5MoD87ryXb
	liQtW42RighO4KrFMbY+qRH9Egn3RKuBgpo6u8bb5ulzPV0cPVU5+8mnSykCp9W5SSUhysTk4fTGw
	JBxlwlZWWt95wt1h/8FCW5VSF8rcbjKyIBdbaPXIWdXonDPds+U0STVfNkgiSOhlnPEHUElPvq/Ab
	jUX2T0s307dcQ/S8FdQPoD0Gw2EBcFTVgT5WPNxytiYc+goehgEYw+mOYgsJFkDPS0rMH0ys8yovg
	XLM/wnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfx-00000008H6X-1c5D;
	Mon, 09 Mar 2026 23:06:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfn-00000008GsT-3n0E
	for ath11k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=; b=l/dni7v/Hzl9FkEjMb3hp6aEB/
	gMKdbuLXZ7wCD9t3HwN/q1D2cFRqXe3MaKF97OF9HzqlpvJ1IDN20Ta52Lga1f/v/W7UtcrNg2GxD
	jqc38nFiFDkp46aE4m6hPG3+RALzq+OgsfEEeNAAEwF1bGgG6UN7PvSWJOnUSrQOWgc5WOf+REEwr
	ZHXKXMSzkfJGO8UmV3i+HGJ29LLeuutwjEDCAKTZyDedgo8xc6480rVkODlkSVIxbdrFuM1IZh5Aa
	jfVNwxWnBk89jvBUMWXrBqbDgFPbGorTM2DRQMekAYL3aAzytl8So/xkRiKBYdMJmzxutrWjzaYgi
	NuKNLPDg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfj-0000000DJoB-2sMH
	for ath11k@lists.infradead.org;
	Mon, 09 Mar 2026 23:06:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC1Bq1298214
	for <ath11k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xPJuWGqmD+8
	ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=; b=ifd7yez9Im1NWd4QlgNWMkyW57W
	tVINyWDwUayU0ofvyVrNXpJlPZbi5BzPstvukcndCx8+sBUFqHybdIZIswuEEhzK
	zmFpSttCgyQIzDo0Uwgdl/0FaMmmN1EjgnaCA4AQmAxAFh50YkxYu49Gn997mxRc
	S575adbLb8WMzcm90Y2nFu6XMVgbx1fF0IPOGRUXNpT3vplyiumkPNTVWF65gXp6
	n/mkmfTxImEfRtoCU5AyWCa8kx51DE8gFX6qwq2zP0hpXCvTgGH+HKqnmqVBKNzL
	PXY/qaHQigjhC7ZOOOfC0z4CflOArbZEHdbza4Mjlv/EpfwKbVd4mpZCysA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv19nxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd849cd562so963720985a.0
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097557; x=1773702357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=;
        b=dGqLow433Ld4vMxZP6LDRT/CC/lWhBpLWjl2q1BBKnH/NeBKIh+g5rSncCDyWZYyX/
         wYDi0KT7nhXJ8bR8mq90TmWSa3xtoet/0qoT7vJXvDHNzJb4UmHs4SkoErsoaeMiFGcp
         f7tY+PumoxmemkO2tjA8lUG7tNniMyFHh1npKDjdLUJW2JUL+v0LQQY22uZHbLUZ0ljP
         Ivl2kIJ8rNTaU88UNqMAI8ktM9dwINCrK7vLglK6WjPEBFYA3y7yEHo1kv5eQhEetrR8
         XMFHj1FFabAlM8m1f9xTB9B/VQhwV/kjg591qFjjVmF57DtRLF+xieSBdNGTSXkSqhIG
         RhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097557; x=1773702357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xPJuWGqmD+8ZGPeNWjPXHXFYrZ4UhGUHfAbfp5Y2vtI=;
        b=ICW7t8nakqjxIYldwtggtwKLQxdV0mJIzRqwG7Dfazk0dc3Gb9OPGgDVLxSNuImwJh
         n+tWL3VgO/AFOcs0kDB2i/HDd8plK/UkMDtEFbg12ieok2m8IC4648OvlgHWVxldKOt9
         v/8AdcvSBtNWd6C0GIIV3it2R2o6e9OCrjxlhGm6dUT0EenEJEakZTSxCAs6fD8lUnHj
         ZnrACYtpaZiXlEwc6U6x4z2VMqScTx4f7qxUdKGum8NimknXKsaWE/1Z9pwFnTPuIJDj
         xRICC8GJ0sQjsyE1ZtmDpg8vmfTUOrDF6R509KgjcCEFIj1s/KD0bMlGYR7+v6GM7ZH5
         U20Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTNq7XrYGwqw7psuPhXf+2EEjeZFHC4O0QIxt6+ACLI2gl5DCvcYTH06QHxHRAR9dZyCAvvfI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVo1vxsTWg4h9IDb3YlJ4PmbRhXXytlRUlA4F6iw/nK5k94rIO
	uNXC8x+EzZbCiv3AnBuytj4OjimXXcNY/l3XeWP14P8bOPJ7owe8zhe1ft5ocqhEz8Rtawuxzv1
	Eq6ES81TWev2twaAbf1Nfui8Vln4OqeS0e/qMD2T2s6RPL1EFjumO75cBrmQ/hYj9
X-Gm-Gg: ATEYQzxIiSZwOpVQ8OE+gVf40s0RliHvv1505Vrjd5ZtYvPVkuJsZ/FC2yFl5nhvOvp
	KT+VNprwk4Eebd3ohdqKvriuMoGmbnYnKhzeedGGpBJqfLpnNvJR/Iem4BGlwF1c23AVmaViopd
	peqjG9S4Dv3oLu9hcCCZoiea2quqI66pJnQBlrU6n1DtaKvdfmN2CH1CBG9SlBCUsn1l8T/Wk7Q
	KphxRmvHDJwh2ZXvTnTK5FA7Mqq0Q7uU5Attj7j1KhoVR1ustTfBKa7Te7zvDipXua8BomtEVcA
	BYHPt5qOb7hawzWYlDVUXuS4R0bfkulx7paX7kSRTXM3GAhtrJrZuigc0HIsu8wrNbNz+RgnFQk
	psnbPBaf+8BYvPwHn1i0uN6G/A5ZruNBe9L3okY0KDv+Bz/F2fw==
X-Received: by 2002:a05:620a:444d:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cd87512fcfmr673414785a.58.1773097556814;
        Mon, 09 Mar 2026 16:05:56 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:8cd:8751:2b26 with SMTP id af79cd13be357-8cd87512fcfmr673408485a.58.1773097555998;
        Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:55 -0700 (PDT)
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
Subject: [PATCH v1 6/8] soc: qcom: pdr: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:35 +0100
Message-ID: <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oIQ05ADqhFr6A93YZFlnrx_jqCyFsONz
X-Proofpoint-ORIG-GUID: oIQ05ADqhFr6A93YZFlnrx_jqCyFsONz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX3kvh9Zkx3EZe
 KVRjdBSTv0VHkdZY++IAFb0ItbNLrJCERHCr4rv1MJ1U0jfFSasiSQIDrGAMBUqC10a/pU4btbE
 519tYrWFxmvaM8+sbIRP5hL9ZM8uZT6IKBlUb9u+t+IOVXFHSDq4V9dnafBGlOBiFJ4HJQSdkYk
 XN+i8Zx6xTnBEIapOfED3aG59jMjnzglirHllNeROBKk5ZWOnwrg86weN94e/at4q5Kpud2oaiQ
 d2tSTWVtyD7F1zp+1psstzUpkfDhVSi/glcoElO1xwsM971UL0ngoXsxTV+/6D7DeVKbTb9E55/
 Dek1a/Dsc1Jd+8Dd4bXZDDhOIR8fqEuQnUzgaBzwPv6FJB/UGuQO1MlIQXTjgISWClpyvwfMHxh
 hhauZybm/+U9W8C1JbgSxF/+gomV9Ka4uUrA+WD+jdXJdtDnoIvS/3JdhWb8pf7/nR6abyB9vlB
 w2bT9WUaosWxDCoTYUQ==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af5255 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=P-X4VuwvMnWJEdMca_IA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_230600_357402_3D151E4C 
X-CRM114-Status: GOOD (  15.98  )
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

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/soc/qcom/pdr_interface.c  | 4 ++--
 drivers/soc/qcom/pdr_internal.h   | 3 ---
 drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 72259f489075..6d879e1540b0 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -523,7 +523,7 @@ struct pdr_service *pdr_add_lookup(struct pdr_handle *pdr,
 	if (!pds)
 		return ERR_PTR(-ENOMEM);
 
-	pds->service = SERVREG_NOTIFIER_SERVICE;
+	pds->service = QMI_SERVICE_ID_SERVREG_NOTIF;
 	strscpy(pds->service_name, service_name, sizeof(pds->service_name));
 	strscpy(pds->service_path, service_path, sizeof(pds->service_path));
 	pds->need_locator_lookup = true;
@@ -678,7 +678,7 @@ struct pdr_handle *pdr_handle_alloc(void (*status)(int state,
 	if (ret < 0)
 		goto destroy_indack;
 
-	ret = qmi_add_lookup(&pdr->locator_hdl, SERVREG_LOCATOR_SERVICE, 1, 1);
+	ret = qmi_add_lookup(&pdr->locator_hdl, QMI_SERVICE_ID_SERVREG_LOC, 1, 1);
 	if (ret < 0)
 		goto release_qmi_handle;
 
diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 039508c1bbf7..6cd8cbe26822 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -4,9 +4,6 @@
 
 #include <linux/soc/qcom/pdr.h>
 
-#define SERVREG_LOCATOR_SERVICE				0x40
-#define SERVREG_NOTIFIER_SERVICE			0x42
-
 #define SERVREG_REGISTER_LISTENER_REQ			0x20
 #define SERVREG_GET_DOMAIN_LIST_REQ			0x21
 #define SERVREG_STATE_UPDATED_IND_ID			0x22
diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index dc10bc859ff4..bb60b5c40554 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -656,7 +656,7 @@ static struct qcom_pdm_data *qcom_pdm_start(void)
 			goto err_stop;
 	}
 
-	ret = qmi_add_server(&data->handle, SERVREG_LOCATOR_SERVICE,
+	ret = qmi_add_server(&data->handle, QMI_SERVICE_ID_SERVREG_LOC,
 			     SERVREG_QMI_VERSION, SERVREG_QMI_INSTANCE);
 	if (ret) {
 		pr_err("PDM: error adding server %d\n", ret);
-- 
2.43.0


