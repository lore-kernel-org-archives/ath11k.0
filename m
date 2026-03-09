Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3B7FCA19D
	for <ath11k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=; b=d/jFuahD4SFCPI+3yC9grazVTW
	91Wptota/EgKKhROfQ554FdX+Xo2tdCv/IxXlSBvAm9LGFAdaThKV9zJG/j62GAlHL/WrnRwndW0e
	Tx/lBSqg2mufvisR8FqpUqQ/q1gv0tUMxlzsH2SwkRsHMpL78h9l3w82TQMcLJOFEtbsSRVBYkIlF
	tiFGN+M5ScbKCilf7J9HQfhWOqaAK/Hk8HAGfuTsyBTBqsVwkBOpuzXHM5LaMi0TcEe6pqdpAuGOz
	qv2idpAAiz8dCAvt5SBrRWibhd+wIj4Y2Q9HSqC8VLD5dUUYLitzg4SNgiYsiMYnZHvshPcNvGz/F
	T72c3WsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfl-00000008Gpc-2vZp;
	Mon, 09 Mar 2026 23:06:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfk-00000008GmM-2KCI
	for ath11k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=; b=Ul5L4/vBf2GH1pordJt4cuVEWo
	lnsYrf8cFWz5ur7b1paXWwxYoa3G/jGUFGy/d1fGQVso55A4yLBmuWe/EgKgfIWPB0dq7GZfMIIyD
	kZ5h++F+3wWmtcwJC5cwk5nyaKEsdCqUblBynodHAct4S3mpmOGre3/mhD5gqqmywklaR50BKBgaB
	2wb+nsvUf3rDAJA49p4kzDYa6tcPWDQShLoyGSBDk3sVB7LLpzESN/DqYN0iIkcpMGQSjcxmFPOUW
	uqV7EFbfTz/LjJzx/E9G6ltBhOD9CQdl84r8ruemeempMncNgUMhhfdjJu6Hs+daRjmZxOSo6k2aC
	od1Cwr8A==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfb-0000000DJnB-0TUM
	for ath11k@lists.infradead.org;
	Mon, 09 Mar 2026 23:05:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0OB744386
	for <ath11k@lists.infradead.org>; Mon, 9 Mar 2026 23:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4nuiFplGeEP
	W6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=; b=gloHc0jcRhYOoGyz7DgdnhjiojN
	H9hpeKUd3Kr08GXwo2N3xaErYbMYE0ASu4NTUYcKjZ9ez2A9Ln/ugpg39/yqLKpt
	mJqC7xYLnB5LKufywMAf1lsUOjU0QpQNbrVZdB+sEyfZQPgeemL8PYJLPvILMPtg
	J9WFvV+Y+4Xa9nvrlKx47wQN0VDhAsMxk6T9hBaepKW6iyHsUBePHNABli94ozlE
	2crJCJTHgxTLIb4YTD/Z6PXFQqMxMW/7NsUo2SFXI008JG2dOtvgKhb9qGrKUvGX
	iIBjRfQLrG1MsJtDR2Pool1dBuNiAgVrmfsr2Hh17M6MiZ/6pAmlisLu84Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaarhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 23:05:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899fa82ebb9so543537886d6.3
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097548; x=1773702348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=;
        b=gADvGCnJXsPlYFIOLrc5wEAY3YuYBX5tnO9ZkjKz/veA/zZAGX7lIKYDtJ+yCIMGLf
         NvXOYIeH+iFo/2GSm8sG/juqDkd8766lrLqOLd/MvSr3xwgqE+jR0Fg1mpqeNiUpa4B2
         fFmmaSVcBXjS5kNPS/3QWGolg1UAvdEWHjDZexln+rA2IDSimY31efRlpvaFqZ9JonMe
         MFY/JboedXmGOrv5vvnzen5SHjZXaWtoqxxlHZ9PwyK9KmC0sk5FQwgExMXWaNNY6ipI
         mv9EhAwI8WX+/UV2MLOEhnHv1GQz56Lw59jzTK8gC7RK8r0z5+OSsdtDV8VAhLVRBFuU
         MzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097548; x=1773702348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=;
        b=TvP9ippFvhEva1ScKE4Fgpy7V1VlbnqplnFcEv20R/3ENsSkwl4Ot+ByCLcuDt5pRM
         Rr9VMIB5xvSlzkD1e/la1RD8yfu9T+t//ZMeMfzU0IWeJwuzoETlNRXWmRu+hEG39Ljg
         lLayYmX+bVNYZqPjlj7zunQCZQJNQXvoY1dDLpdfTw36qLNk0Qa5wzVhUSkvk5eftKUE
         ErboPQrtpvHBrykrXxgpDQGVT6KBwfdlbF4hJYecotU/m4X0wGhAASeqakUInvIy5DfO
         H8bIjU+1+awFqf9755vlgsSkeQmKZ5KspmmOre5KW1xHc0geRbvT6j720AT9ilpdYrqA
         aWLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZyhgpkSU3Dy0JwSc7swuSttm3xXlWKrpQWPzvxYh5YeCmAyy5a+TvdMucTWz0tgeLcAy30U8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6g6rotErtz5L2x7RmbSL4VquxHdOE6XVzWlpOGSKF/6FoJVnR
	xkd+DnR6AobJm+Ol/zUYg4djrDEFYBLbQdr1orT+tgiSlI5MNfV+mh/XGo+CoYYExSMHE+H0fX7
	aUKqmuRngdg4c+AGAbyg8kd7YQldLvSCjrgNZ/37PXtjfqxY2/XDlLU+52Sz12AyO
X-Gm-Gg: ATEYQzw2rC3d8/gqVX4HMe+xOyQ/ckbqGbmZKzJ2KXYOi9Zd3NHEGCkfluuyPnQi/f9
	0gN1dxGvQNb/MTu+y0SKFG8ho3dCAwEhp8oFH3t4jYwNR8c+I59Ek1OU1//dFuO8szRjqefTnCd
	eu0TmXsw6s+vBvhQ9q0ne8s7tUsJDDozQ8wrkL7KTHF1HEJEOE9Y7Ukhjusv7RxmMdSPIyIWZSh
	HVOhWY5PDwxmNabwNEA/TcJ1QXUHU6PTmrXD+KyQYYXwN/bu66GxmyM7hhNPQ3VUZKLv6EF91Qj
	5eZF2N+UEgmcZR6zQA+TxS+fnDQwWEEPslHyC4HZef2THxlRlkp2A7DWx1kHK363xiq7yOyA/Vo
	MJKbo6hd3Gdp+OUdIHq4HFr/YfW/tagBYk/HbUrjVMzAyUmfjgQ==
X-Received: by 2002:a05:620a:40d5:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8cd8d4cadd9mr467939685a.0.1773097548051;
        Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8cd8d4cadd9mr467934285a.0.1773097547515;
        Mon, 09 Mar 2026 16:05:47 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:46 -0700 (PDT)
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
Subject: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
Date: Tue, 10 Mar 2026 00:03:30 +0100
Message-ID: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cYrD3-Ye9x7XF5obs5XLzHQJzmPXymYe
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af524c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=NWmyY4P_PqWfpxtJLaAA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX868m1RIY5mDl
 cgLhPkpiBR7WjQiPdr/exphofT7a3gO1LHgi96LhtbzHBGiI4gOYE5RJNDxScf80VWYu0yXsS4U
 ZR53jQZ6A9SNxVexI44a8kLZPfGbGWPqd4TrWXGnriFDz/wMbZKISedIUP8XaWBvntXenz6bQTQ
 xl+tH6LXv3tSFazGxfGcFIKnThwm/I6yWwco0yk2Z/Uv6e9SPMIIYFGsNIT7TdeW/yNaPTDukxL
 IRTdsKGD/dPnwQGW4RfrOtN1DOpXUh/3r+pR9ERPBVZLP8cX4s8qmMcAt/Zpm2AP1RHgnATWPYw
 Ejul/PPERhiYtD0vnjNcp+qNhyiwjhKLSsU6wky+FelkvFe8Cp3dRliWgiIz9jId3mN6prZoi6R
 rhm8ma8h61fxUn/3oyBu7p8tDjbTyVxEYRb/9z+uR3LDg7UWwsgcbsDk9aXoWAF2ue8v3wRY4r4
 an2hXs7vEx5JDVQIrjA==
X-Proofpoint-ORIG-GUID: cYrD3-Ye9x7XF5obs5XLzHQJzmPXymYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_230552_446060_FBD2BF2A 
X-CRM114-Status: GOOD (  15.89  )
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

The QMI framework proposes a set of services which are defined by an
integer identifier. The different QMI client lookup for the services
via this identifier. Moreover, the function qmi_add_lookup() and
qmi_add_server() must match the service ID but the code in different
places set the same value but with a different macro name. These
macros are spreaded across the different subsystems implementing the
protocols associated with a service. It would make more sense to
define them in the QMI header for the sake of consistency and clarity.

This change use an unified naming for the services and enumerate the
ones implemented in the Linux kernel. More services can come later and
put the service ID in this same header.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 include/linux/soc/qcom/qmi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index 291cdc7ef49c..b8d07f2c07e7 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -92,6 +92,18 @@ struct qmi_elem_info {
 #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
 #define QMI_ERR_NOT_SUPPORTED_V01		94
 
+/*
+ * Enumerate the IDs of the QMI services
+ */
+#define QMI_SERVICE_ID_TEST		0x0F	/*   15 */
+#define QMI_SERVICE_ID_SSCTL		0x2B	/*   43 */
+#define QMI_SERVICE_ID_IPA		0x31	/*   49 */
+#define QMI_SERVICE_ID_SERVREG_LOC	0x40	/*   64 */
+#define QMI_SERVICE_ID_SERVREG_NOTIF	0x42	/*   66 */
+#define QMI_SERVICE_ID_WLFW		0x45	/*   69 */
+#define QMI_SERVICE_ID_SLIMBUS		0x301	/*  769 */
+#define QMI_SERVICE_ID_USB_AUDIO_STREAM 0x41D	/* 1053 */
+
 /**
  * struct qmi_response_type_v01 - common response header (decoded)
  * @result:	result of the transaction
-- 
2.43.0


