Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76ACDFCA191
	for <ath11k@archiver.kernel.org>; Mon,  9 Mar 2026 23:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=; b=v/ynO1K9mMMDWsKQqXVhRtaqho
	23flZ7DIi3aPPtHvGWTcSjAK3l6YA6Qw9TUk/h9mKjxDAxVQqwvuZ8ciSO9PNlHjSfCIGwcUCptwB
	thq++PgKURj8A+E/ZXmyEdOFO014q6xPB/9l5KP9UJOqKums/jR6wpooc7mCuifXbn9xtaGTQhyzY
	ZzByiWHSavxephY//+QLmLpE84lDai8tKlgx3Y0uBrztlpG7qFdGirg5ViYpmnUvVDtWBbAgdl9me
	QK8wACeKBSMmqTeIclDM6La8c/Ad68deHFZC1hZq6kx1K2qlJ84NA9vsqQEVzWb4bD1dzEiriZHOU
	baX377lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjg1-00000008HEY-11dT;
	Mon, 09 Mar 2026 23:06:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfx-00000008H4m-1BDv
	for ath11k@bombadil.infradead.org;
	Mon, 09 Mar 2026 23:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=; b=UOOznTufR7rRDmicpTnUpsOvxg
	OQXy+oci05oo2UHeZeirwesvvRl25ZvhISuG7JfTf6Rep4IbMoR2D+Urb4RQW4+XjaegsyxbmWPbM
	usoD817DBw30dOoZF3qwg+C9I9gR71ck2FYtMHuwlYmXxbHiA2WiqI18II29Eo6v+N6H4u5mYiiw1
	I5BZaneKpZPPS/1UnC1ksEvucd9vfV03rOjqKJEwOUsGJ8tcn5L2XnjMJhb0ii6Or46JAd397LMPW
	WdEQJ88Rb/16CHi9g164dR2CbJTbQ5qvRGLRmbXbRIQym6kLQnMWUGlLWNhuAJgD3ytnynJVypU2h
	M08Jg3vQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjfq-0000000DJqm-0lJ2
	for ath11k@lists.infradead.org;
	Mon, 09 Mar 2026 23:06:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBtsj2427754
	for <ath11k@lists.infradead.org>; Mon, 9 Mar 2026 23:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o+8grnDyx3a
	Y04II25yHs+DhlQHwGyE329UXeTulGfo=; b=EnmPJzaXDKfHbBKit2i6OzOm42b
	lS7sFWuQdyT6nOJsixiASHIu6RV+GBs7xstRQSxbPvjcChqJJ9XpdtxtEefvRUJ0
	/vzUYoWy6seDLrKnbfnBzBZ7VHyqTEwYNlJxSa42KZQ35lhO+qqrwgr0MhgF2v2u
	XIUOlYcxN0l/SiTaVR+/4vyGrXSRUNY4xGr02/UBTsA/bgKRuSiv0R0QaNzhBiq4
	c9maWi3bGH5wkaI4/sbRIvQcfqVK9l5BSHbTV8yOOhJoz5OsXsJifEfv9WwX4F3p
	jdImAMabQQwyG3m/dV4KrPkxvDG2ukxU3wSswURC0mqLM6NZKINavIDuW5A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1eks92g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 23:06:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-899e76aa555so458138466d6.2
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 16:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097563; x=1773702363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=;
        b=OnTymdilkYNAzzNqAHl+rQeqDUDAFAorSl82sM4b0Xs+dKQSerTTIPuMWAIkTa/cmI
         gqaImpNvr+KJTpLOR0AoUVSm9RY0WpvljPhHvH8Z+1Cc+jUuHCOZkniv8QpR4c5obDb7
         f14BZ1ykpWnDZyjJcNtzePEPdRptRVX/XVvqFt/4iojXppURdRWyQ5BzqElT7CO4Ru1c
         USn9jH6eFl2nfk5YhZo4cDYWTGa6+zyt9ifJmgsuznXDPaoe8XyQCVo69ymys04Y6oJt
         P+9zmJ2ALL5n3MBgaPyRlNJJIzC2EedupVMG/uC9pKH07xfKFmHk8p03smo/nJLvEwjs
         TDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097563; x=1773702363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+8grnDyx3aY04II25yHs+DhlQHwGyE329UXeTulGfo=;
        b=ED1gPgHCw4XkNAmLGul74ULx0CQ+EVEgTP4Ww9WS2BrBBFB3/YRgkhmU8KBgOpY1jN
         FPyWGldMgN41dT34Rz8bTD8XWNW9rB2CYjCGh7fvYfF296SVNNDNCScyUEAz/Xhtm/xm
         T/Xy3O3BPDVPbLBz/RJlyaYNKm8vRI4ZX7vWxBXS5e6x4JPi22ifSUkHuO7D2bYyK5kE
         keM6i42i49Rxiko1WIOhLt1aEyIsCq+S7doQlim9ctBvYbzvq1NMZoyVxMlkBphOaOci
         iUbesK9Q7rUG2oTLoC4Wk6CSQL2Dc966pwcDob96k02p5d3OmDQzoQi5JIyTa1gAqpZf
         osCg==
X-Forwarded-Encrypted: i=1; AJvYcCVnHEc6sHh5kO3hPOt7ANyHuY5C0EB22l6oHT2gKE63ury6yJk47R2EL5apEMf3HmnVNxs4hJE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb3//HeEezKrkVLhgVuOryOQje2XkwhBVPlfZY15l1c/1l5LoI
	g6Yqa3Kc9iYPNGhJe4hDLym94ZjUdsM+bJHC60iLwiiI74bsU6Rnco4r6sySHOOSac4o7zNP7O8
	UCjuxS1EGXvNLXIlyV67LMG8zp0yx85ghhMq+wUZG0ArRjpJSQ6kn2KSNPEjpR/hH
X-Gm-Gg: ATEYQzwnxsM6vCx7pkARQNwIwCbSu6Qy8HRDY07n3GhehXKE/iZeuxLtRntcOczSXxL
	I3IiFb0La7cuhVyUXRK9Ic60mS9CSoprqD3YbbEB9SOAhl/bvD50xxiG2kqN4FjYchQj4EaVg0R
	zQDV1FyMNPsbDviJ2W/HIpxwJvM9YsYz3m/FupzNTUTOwboysSjAF23xhKLpe9wXywec+utm8cS
	Wyzt2AqdFCA64tugp2u1ftkGU+gajCPirDHnd/mpizWHAW6boa5f+6fFFMWpPLADFqHupi7hL0i
	nJWKtGpwDJMctvTb/jy3PbmIu5eHgrOhEFPIW65riYmb9g0vCKGvW1VU9zafiwvQIJR0aoPQJVn
	xi3C3IwkquFCEPQrjc4f37lh+p7pK+Y1KucHXLpamNXb9+IiImA==
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr1568429085a.2.1773097562705;
        Mon, 09 Mar 2026 16:06:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cd6d340439mr1568423485a.2.1773097562240;
        Mon, 09 Mar 2026 16:06:02 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:06:01 -0700 (PDT)
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
        linux-sound@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH v1 7/8] ALSA: usb-audio: qcom: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:36 +0100
Message-ID: <20260309230346.3584252-8-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 23ec0sA8tTAogRQinmNwdrHBOIQTXWBC
X-Proofpoint-ORIG-GUID: 23ec0sA8tTAogRQinmNwdrHBOIQTXWBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX3SHto1oYTqce
 j2o3MGFZMecJVqbn5KaqGHsr1ei0luALyKKPCKCLAEgzn9/H5UH9WRBEiJET+QByTuY8ullAUdW
 Jqo07mzGjM6X0kJmajgEJaACw3M9YPEn3KA6M54Vy27xzdJpgZnrnEDz6w6Q3xPImlM9aW5gPXy
 q2Uh8O2DcKXxEKinp9MzhQC5otv7ayD7Id8z53lr+QkZNCeyqKD53h2Q6bqMkydQwrvPElcTp8B
 oOgDtruTcR088/WpyeaOLb+me9Na3W34S+Gn04SKbcqgQ7DayGNB29nGLENmQ1pcLNgxpehsZ0z
 lFwronOTXkQ/tte1XIGrSrpRqeDXKntYNlbp0Of0nXET3Tsz4NfW3j/+RfGUJGgvtYSgG3LipeE
 C/ChJuyReXLuItAURfa/ArMYK9BBDh+5AkFwqKl6z8eyAvqEY851kbbOYuC8pBon3TvMZ8SGeMy
 X7mikc+4aZ011enTYMg==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af525b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=GLuZV9TbpKr0kWuSc8UA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_230607_730819_133132CA 
X-CRM114-Status: GOOD (  14.57  )
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
 sound/usb/qcom/qc_audio_offload.c  | 2 +-
 sound/usb/qcom/usb_audio_qmi_v01.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 510b68cced33..bc4e1bdacaa8 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1927,7 +1927,7 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
 			      &uaudio_svc_ops_options,
 			      &uaudio_stream_req_handlers);
-	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
+	ret = qmi_add_server(svc->uaudio_svc_hdl, QMI_SERVICE_ID_USB_AUDIO_STREAM,
 			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
 
 	uaudio_svc = svc;
diff --git a/sound/usb/qcom/usb_audio_qmi_v01.h b/sound/usb/qcom/usb_audio_qmi_v01.h
index a1298d75d9f8..c7eee03225ec 100644
--- a/sound/usb/qcom/usb_audio_qmi_v01.h
+++ b/sound/usb/qcom/usb_audio_qmi_v01.h
@@ -6,7 +6,6 @@
 #ifndef USB_QMI_V01_H
 #define USB_QMI_V01_H
 
-#define UAUDIO_STREAM_SERVICE_ID_V01 0x41D
 #define UAUDIO_STREAM_SERVICE_VERS_V01 0x01
 
 #define QMI_UAUDIO_STREAM_RESP_V01 0x0001
-- 
2.43.0


