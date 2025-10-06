Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E249CCA470
	for <ath11k@archiver.kernel.org>; Mon,  6 Oct 2025 16:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wo69v9N0i7yus5uBIq03Txo87lWpTPaftw54sQRNMhM=; b=Y2lj0WmGf2zbgT2XmpZfofomqd
	cEeuiRtu20Ci7QEaONVmc0dSM523T/FwIcyPAb7avJoOi/k3NGVXs7zWGLrPP4U5Q7mbRHmcKIe4i
	HPU3Ye0D358LkP7nptgYOg/IfRWAYIuz96uLyJQKSo72Y/OFxg6wu+RjAnwRRFQqg9d+N8DsTCus1
	YSKmHPHvWtG6afj4eclo/RwjZVmfueMRGkupNjEDASIcyOUCfL7SNpAJd5JALcEwM3bDpxFl1VFKR
	y3RoP28AddzpVT2DDbIgVvlgxzbwOsgSrO+klpnheO9I0Ibe0v1Hbgmp1Ky2R8iC4n/2r7EFs/DzH
	3Y2+REYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oRK-00000000S0l-0Cmq;
	Mon, 06 Oct 2025 16:51:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oRH-00000000Rz8-0fiC
	for ath11k@lists.infradead.org;
	Mon, 06 Oct 2025 16:51:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596EkBQ2016143
	for <ath11k@lists.infradead.org>; Mon, 6 Oct 2025 16:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wo69v9N0i7yus5uBIq03Txo87lWpTPaftw54sQRNMhM=; b=KU77/ZbNmc6ao1z/
	zwv2bS8FUKkxW5HkGNXc9wgmj92lxSW3JP6G3PSA9mkaBrvcC34bWoECCCSZXAJR
	Hukmjfsi14Nb5aZ+jgJlvHHnCPL7/OkA5JuPJrFIK8Kt3oGplT02/CyCtEtpnGA8
	5+XsSrujzh77LnoAN5ENwKkQaeljI2L+6Dh4Ho59TjHjFtYHWrTMI1QLEH8c08In
	jqiIiN74N9dPkZqWjuquJQI5nmlTLJtw9/cv6d0pAbaeuLfCX7IFH4/YHfjybcZd
	u9WOYHx8i95P1iBLZY6/6K4kPArixDWoKDLuEsU5eFGdK0eCs4zxYD5VCt1TooHr
	cilU1g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jthpvned-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 06 Oct 2025 16:51:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-781253de15aso8680402b3a.2
        for <ath11k@lists.infradead.org>; Mon, 06 Oct 2025 09:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769513; x=1760374313;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wo69v9N0i7yus5uBIq03Txo87lWpTPaftw54sQRNMhM=;
        b=SRMqQ1Bg6IyXwfA4Z0pFs04pj1ZnJKnr6PnuZvJYt2XUef15oi8qZ23CZnoCxRG4cY
         Oju+o6ALTsMPxA5Z51oNRT/BChOtIQRKwK8HRe1lTynjSuvz8d04T6GsHGhwUDZBB9/m
         6BUcPKYqE/CaNRWJxNLr3mfdSeL9FBAG/1orjORsdMd8Py+XhTDuhS09B7CKOcN//uGZ
         /lu3Up4vP9tpRfsh/RjI69HjjLMRgpAvGCGqSfQ5nzXt6tG2F7QJzp9wm6AEd+e2QvC6
         45l7Ha3adJdhWldjpzv8kKUBkDIa0UWXf0m8M+qA8eERijmZvOvjACBYXsz9b4K2iCvF
         ww6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVIbGQxJGiGhvSnZ6WGw9fmR5YRlcqlU+oW3PNHvmprarIGtDBx6fpnkvYGW1NRnsTOJui6+c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2hwS8j9YdRDsvXOPHWG8k59/OMehS0IExQ4PsaHWkW319Ac3f
	yazdA8TZuBpVPtUc8s8Rw3GTgpA2TpbEcVydqtX9nMq4xcPHN0TQgUST39WyzgdX8w7f+tQ1uiS
	6qxYS1F34/DjdjEiU3Xc1LORi+bBzqE29EhoMDN1PcZN6iKZGlHMVf0T0+dF7VSai
X-Gm-Gg: ASbGnctlFiTV9+2IugZI2w4g0QAURjsdrN0RLbhHkQy65HI36AnYgnCfuTRvubhXpvK
	dNTNXgKcvuj0mnN1xO5XRBhWZWtC8DIpJcyLwNIzFlMSgSkI2fgdisZaGXhysdbLwcNflhbXbsp
	EYnBb6NbqNAh47jQBw9f5QWy5JgBz7gUbWcE1rvWXCfURTdGyje5llWorkrw3cQDo/nXdzKxLer
	VaDfNtgilCThGoOgD2IoWJ78T8uYhOvcN6D0WzCEByfxeF8Na2bhwrGO9wKuil6w6rOysuoc5pZ
	JE6xWp5cJ5VLam++BSc5ok9XTf6pI4dRE4I8TDyC/7O8myxoMt+D6ulwd4zkmK/OOlKL6CJj3o4
	4UjmqGQ==
X-Received: by 2002:a05:6a20:7f8b:b0:2ac:7567:c069 with SMTP id adf61e73a8af0-32b61e583d9mr17724733637.17.1759769513475;
        Mon, 06 Oct 2025 09:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETt6fN2a5uQ/TBgiYmhUZtcG9dd8mwsIIRymgKPE6BSHmuorQefyP4JFbxPMwBPSwvxcbj8A==
X-Received: by 2002:a05:6a20:7f8b:b0:2ac:7567:c069 with SMTP id adf61e73a8af0-32b61e583d9mr17724705637.17.1759769513059;
        Mon, 06 Oct 2025 09:51:53 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0205336csm13293176b3a.45.2025.10.06.09.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:51:52 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250929192146.1789648-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20250929192146.1789648-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2] wifi: ath11k: Add missing platform IDs for quirk
 table
Message-Id: <175976951234.3451922.1302880550621653546.b4-ty@oss.qualcomm.com>
Date: Mon, 06 Oct 2025 09:51:52 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ZfFMY0vPscitydwHzSn4VE3EUV-m2lyn
X-Authority-Analysis: v=2.4 cv=N5gk1m9B c=1 sm=1 tr=0 ts=68e3f3aa cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4eKdMI8an_lkvHNd_m4A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNiBTYWx0ZWRfX6yIg4O/tDBKF
 QEXDEfeNMHjyLMm893G4P6X2XAmbwvC7u5GcE/fpD+sxUTC5k1eA1qOIPDkdJuFKtnsP2vElZob
 OWrOfj3SFpLbDrKyPCGnrFQF02q5keRKR93iAILMtZbCLeN83VmpOOeHh0nLp2yAqNp6ve7Rwdy
 W+lqyvM2O9yoCWoNI826WZdZJ9/9X7Xe/O5malKYyA5f9p8ref0PzsC1AH1ETYnYS2mDHR6rdZj
 EdtvXiYozNvYHOarlgYQAZNbHHlVyZkaUbmCJDSseicTnY6mvYmbMxx76GlNlJkekMnIiUIaqM/
 4KaN1WZMR5/5tAkqYsmxPZcE6xh+wTzrN9B2mkyp1B3py3LHGVjd+W6xk4NV9/S76kx9S63hguJ
 kiaxTn2k5yC5pfAKhKkShff7PD8jFA==
X-Proofpoint-ORIG-GUID: ZfFMY0vPscitydwHzSn4VE3EUV-m2lyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_095155_206306_9B8F753B 
X-CRM114-Status: UNSURE (   9.07  )
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


On Mon, 29 Sep 2025 15:21:35 -0400, Mark Pearson wrote:
> Lenovo platforms can come with one of two different IDs.
> The pm_quirk table was missing the second ID for each platform.
> 
> Add missing ID and some extra platform identification comments.
> Reported on https://bugzilla.kernel.org/show_bug.cgi?id=219196
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Add missing platform IDs for quirk table
      commit: 0eb002c93c3b47f88244cecb1e356eaeab61a6bf

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


