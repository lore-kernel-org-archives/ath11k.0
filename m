Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01C2EB363B
	for <ath11k@archiver.kernel.org>; Mon,  2 Mar 2026 21:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5ZXj5N9aNqZSxL/OBjXVW7EXYIkiLOUpceEWatfCSU=; b=JwK4cP+wm0u++7vIZHEUSDh/Wy
	gTc0tM9YTTXjRCqg3juc5KROqcN/3XSAmOBVLVNkWyctCCU4QOpyhCR4bXu41JKKmUZb57qq4ZR0m
	HDwmUrtM7+HPqWHGRPtz0i6Cifepi4/d6BIJzHcR6cuhK7BKeIjKRfwS2FIWwNZAL/XV+fumTmk9i
	lbMHg2TtjNiCo6Z7gsMdDtHGEsGIAW4j5ZxZqbs07WE0YfqJaKhp8x6bImwZsDwJCXMq1GnEGmSj+
	eLimYtulv3vUa4WTLLtqCdzMyyjWMAB4Lx7WPc/nJVP8TbJgslVmC3+q9hZ22GdytYCItP3URBSIU
	xtrxABfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAUL-0000000DztD-1P4n;
	Mon, 02 Mar 2026 21:07:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAUJ-0000000Dzs9-1Rh9
	for ath11k@lists.infradead.org;
	Mon, 02 Mar 2026 21:07:36 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622EJHwl662205
	for <ath11k@lists.infradead.org>; Mon, 2 Mar 2026 21:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5ZXj5N9aNqZSxL/OBjXVW7EXYIkiLOUpceEWatfCSU=; b=d5EcI/BT/ugSeRrQ
	2XXHqptkmBktwhuoxBS25du/EJTj1FqZjvbOSZZhYkJBiQVq37e3BOh24TYXq8tJ
	WNSQOlkpmAHd0xkqoOR3ycTXflREKHT60/fKzucRdETPhS9xLAYHuvEYhlGPB944
	iB8GGuniCW/11FMUNc2OW7ZnbR/xkL+fuWGIEN51osQ0IwZ3z2N63Cr3qEwpcdDv
	WASVlQK0ON4ikp7a97lc9iRvnDgE7/LocpbAhY4OKCYCAafu1upiC00ps/bAXy6Y
	TU0PzAcImodyxlh6p9n4ZhNwhFq4hNyo0eXJRcJrn+9BxAwA4DcluZgY9754s0ti
	/vIjyQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2tnjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 02 Mar 2026 21:07:34 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d194b631d6so34325159a34.0
        for <ath11k@lists.infradead.org>; Mon, 02 Mar 2026 13:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772485654; x=1773090454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5ZXj5N9aNqZSxL/OBjXVW7EXYIkiLOUpceEWatfCSU=;
        b=H79Ct5OZtBhRz3fAWXYNjzKUxYZYiarlPDc9x4IUgnpjpBumi05z6W1RxeHDZ0KcRa
         9bEGQLhmnATmvqYH2bxWJAsrtRETo7qHlLSS0G7rhHBS4/LJ/TPiyQHHIR+L6CPUOCbY
         Pxt+IGpAX6LlHlMKJfwv0dO+GM+IJT3yto6DsRuwZSgd2jWjDlYGuzCTXXnP2Y8erwg0
         sz1CPBYKiITdw+M1opQ73Y6BfEHUo3lLpUx19jf0E6dne49GoHJgAfi+HEt++bYjoO8L
         ypxYUbva+B/16m1SAoMDCPhAIFlb+KW9cmCtOYY73m0JWtsgHGZoacSLZhWrWMpE8Xdd
         WJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772485654; x=1773090454;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C5ZXj5N9aNqZSxL/OBjXVW7EXYIkiLOUpceEWatfCSU=;
        b=lEr+yMYi5wuMINzpjBzQeDFje+s84JetVtK/QSx82JaMitK0dY1EYfchfyeDdsauz4
         /H+HMYLPfa2g9iQnqN5BOa3lXy5ie0VTIdeXAx63AH0psak6tkhz/iuAzKulfY8gXdTZ
         3ytzMPpJgSMLlA6yrUAg9KJQFa8NAUXPZ6gX2of5Lx9us1wPGjic7wREcENqTbktec5+
         LmZ30SiF4MaHjHvDxY2RdX1Dk4ki7tev09MNKXOtQzW0AM1cM133Wu+ldqdDIYv9HzVw
         3PFlyxnBPxpXg0Y0e05AK2Z5S4tZSGlnPJjuBE5+VnvoIA+Zs4bcZ4LIASWDyFsUxOog
         fF5A==
X-Forwarded-Encrypted: i=1; AJvYcCUv2cKMSQJHNEnErVSyScMbUEEnaBrHFqK1+H9aLT3YlcFjdTSyrrIJ7Ab+OYrjJuaFuC7YL5Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWAD2hWsNEpH9pniv4/cMBxDqL3o+jJxz36e81SANd6ILIPAVF
	9Bwe++uCnx4/4JkQtG+rlSVjlA53L58+1uTp4Eh4AnGQeWwJUBuTRqOyOSaHxDmdDmLw2+4JYPK
	R4t09MRMsxI+I6mls8IOfa75SW0DF82JiEQ9YxfanooyPTbL2zCwqRx/p+fMsoNVjfuY7bXj1
X-Gm-Gg: ATEYQzwl75CaIUDhG7tiNSEsL1qNTGEdz3REGYHiEG0byWhFrqSIU8bU3QBsAg9UdUo
	LUEf3+fMhYGyOvOmzbHXTOPZZAYiIQHod/a0aeAfLn1OZE5pNaA2Vo16zrg2noJpXksqTsD1Uqe
	hJJmP6gsg9Z6sFrXdqETMKGGvtKwxjdoRqozw0+XlLr2VlrPegL4ZemNu6xPTm0jSce1UosRJXs
	LOQbyzq3XmxMSxVLGcF2Tk49AsTlxpHXWFNMjjcOw91rqSMNIdtBfcbllJYjTVkcoY52bZy6pVL
	SIJMw0CZjD+9u2OeeXzovHLF4udATXCysDr5e1LnVBthA8UcNJCsjwRVV+jQojeytAAkj21Jr/O
	WiDBB+6d2RXa5LTOhwVAlqDaIq0AO31hByITkoMhA/G0KNt1VU1cYZokE/GHoeDyrjyP54yZ770
	qk
X-Received: by 2002:a05:6830:3786:b0:7cf:e32f:de72 with SMTP id 46e09a7af769-7d591b3e1demr9634975a34.6.1772485653725;
        Mon, 02 Mar 2026 13:07:33 -0800 (PST)
X-Received: by 2002:a05:6830:3786:b0:7cf:e32f:de72 with SMTP id 46e09a7af769-7d591b3e1demr9634957a34.6.1772485653365;
        Mon, 02 Mar 2026 13:07:33 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d5998bc31asm7449967a34.23.2026.03.02.13.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 13:07:32 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
References: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath11k: Silence remoteproc probe deferral prints
Message-Id: <177248565242.1002715.10369057286186394328.b4-ty@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 13:07:32 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: HE6egI5OuMfdhOWsG6-v6TJhBsLfybKF
X-Proofpoint-ORIG-GUID: HE6egI5OuMfdhOWsG6-v6TJhBsLfybKF
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a5fc16 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6yIOY4caXks06VLbqCEA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2MCBTYWx0ZWRfX8Iy+Ruscu66z
 63hHz1PxHA5GubTsf1+iOCBdLV4GyyOAp6zGwmBmSGmA/4QwgGtmdM5WwKi3QrwiWo+vSI2Chsq
 IBBi3CEzFrWIVZ8pgyzFsRYz4u1wRbxcnA0T5lHeY+OMW/APyib5kDNcN8GWbMQbIOhrB90pSQk
 q/AZ1jEqUGXkYzCTSFbs6amEjSeipvov3Fr8QEKBeTgPVFlVRMj7EA873hCvHRzpLbVopzPLzhI
 mgHaQnbZWrLpX/nqzs1CCTYl6A0DID3mDjXmcUJu9vBaNYqfSVlN33Da2AtnJDtqZYyM2k9kuCT
 se69ADWM4mEj1DqYENx+QZ0VXD4qlk01A1wgi24aBJg3X1HsxIJ6hROs3WhRf9nWlC3NFIX/quu
 Y63CW3TTrVTeNHTlSgd2f2kFEbmXpaU+E3Pnh4KEG8Jc0wFhb1gPL0QrQ/ewcHlti3uwG+x2hvK
 VTqz3QSS6GByiz7B7FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_130735_411297_8FDDBD76 
X-CRM114-Status: UNSURE (   8.99  )
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


On Thu, 12 Feb 2026 08:52:52 -0600, Bjorn Andersson wrote:
> Upon failing to resolve the remoteproc phandle one ath11k_dbg() and one
> ath11k_err() is used to tell the user about the (presumably) temporary
> failure.
> 
> Reduce the log spam by removing the duplicate print and switching to
> dev_err_probe(), in line with how ath12k handles this error.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Silence remoteproc probe deferral prints
      commit: 6508c9752451a7e5e44a325e8563897a67f5344b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


