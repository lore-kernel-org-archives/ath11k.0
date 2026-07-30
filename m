Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F49EC55164
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 15:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0e1MCIXL8gKMWUwtGXYTa0AMbBBgxwuX7rr00z48Sjk=; b=3dpa3kvm0vbKzGFBVlyYwjK3hN
	cuzAW0jvcjA5+n0BZ7Pu5c5wfMmAc8EzCADGkhdZs5CgOZDzsPuEEOrAmPZUZ/rSE9Lnd93ni82Zh
	TghktomI5B/J/wFxvxuQxKyxbqZ7V4VKR4jgvkH9GY0CovNtznVMHldWztIFEZuSuYDiEmBPxb342
	qlMXR9zZDiHZB3IHb4GMCoYQnUHK36nwtYgSKhMD7N3uC1lQi7y7kRXJl0v7ph2fBJkQtDryHRh+e
	9SnXlziElcfKzq7YUGHeqUdQ05EHnC0iR2KuhdUlsq04JvN8dbFJngBTywSWhQWOVN8vN3kA2T5KY
	xKkaiRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSPY-0000000Aok5-3J4p;
	Thu, 30 Jul 2026 15:11:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSPW-0000000AojN-1Dfj
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 15:11:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDedqK1229000
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 15:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0e1MCIXL8gKMWUwtGXYTa0AMbBBgxwuX7rr00z48Sjk=; b=VrAvbfaQF6j3Ic9F
	iUdFLk2e2RV8iT7Gta2FsU618Z6VjoEIhgcl6IzYrSjQzIg6m9Z7hfptvCLD0KTz
	hbEXM2jp8oWpMAUTmXnoOehqmZXFPfUkwn+IUXKd+827YnuyIwRfrS8t3uj9g2ip
	iD5dube1fkXvoTwTA8bhbLlj2W3PJbYMWs2aufCv0UEYJNux9HiBNyeZ1blydXif
	z+RGQJeXUZcIM9Jocy6v/KNg/fje+k8j0LSluk61ywsfrWbBahQ8Y/qxXc826YHn
	J+uPg7uzYvxZ+XS7c+QyltKXAW8llV/N6IMkSGhvCOVa7ceGRJLw1D7y5uEfDPWV
	MjsxQQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7q3gepw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 15:11:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so3175070a12.3
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424260; x=1786029060; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0e1MCIXL8gKMWUwtGXYTa0AMbBBgxwuX7rr00z48Sjk=;
        b=XnEb9R/CCFM8HinvfCUJz60RzvrUaMW37ScG1VMdu81K9cPvMbuMZa5k93u8Sa4BMW
         xSP9apwD2KFParp7AHrDaWDjR+aa7xNnA46j3B5kLPOO0g3RMSJr692/6eVWDUIrexHc
         ilZcOAR3ZTbGDelLfRib5/RRvI/ME4tYtyDnrkTaCxsfreVlJkYxJGtfl16CPjMBwGE1
         oCxou7GlGz7LiX4HdtAG7hvu3YbZWFSwX9DhsXBh9SxiNdcqe9PWMgC+Qv57bqmzrB0t
         4l+X4sGPRSHFralCXqoRmQOZ35C6zvPKzhGUDCJU5Wof8Atihz3mr2N15/w0SYG7nIEG
         pM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424260; x=1786029060;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0e1MCIXL8gKMWUwtGXYTa0AMbBBgxwuX7rr00z48Sjk=;
        b=RZfyjCd9iACm/vvtBQ69tdh8lizqgr/dk9QRrMI/Kvvj3gEdVFhh56y+/KBSon/8nq
         Y7YPjcGOsm1ZHgUbkun6aaEGbGM2RBiUING43XM6SGVgpcp9BUCn+9URNKnk4T0iiNPN
         OA2pwnb1hqJ+wIAGkVVgZjohSYtkg3FO4xhKVrJsVzUATsicItHpfQ8PgWUP73UWOzJt
         X+SupheQJzle/N8xggiBHeMaddQO8jhr9TzWWbENPRpu6foGAYHxKhIWPspBZVxKk0Vr
         1M4CleT24va1xqPn22XBpR8yrZdWTOog83vWQJnfK70PUsq9buR6D9MaCGvcWl0DYqGg
         ECGg==
X-Gm-Message-State: AOJu0YyiE5taNQgf0Qp4zErm9UapswGRJ1wN6/Z0nkqWebdZ7mQ5NWLa
	cTVMmf7jPOXPH1PVqtX3HpqEhDH8m7aLjzfk9MXXa8xOCtRNcfMy2ERamsQH0ic8OUeAB/Nhp3H
	Jl/cn5IL90fTi/PqxEecKFu+/LscITU6lgIW6hsXnaQRBbwgFo5Y0ETJMsC9WzIZlOsxfEjUO
X-Gm-Gg: AR+sD13HSTT+P9WS3WS1dq2J3LN30boL0J+ftOGFFMrB8QVe0kcVo4z9XQ3KACWkxz1
	HwyZ3Nl0D5tvhzNwNmXJeSedrjsa/mzDbliXNLdmtbUe9VpGOAbXbb10bEIbuLvPw0gu98SPArz
	ahWz/lfwo7zS2sBBd73qaCcxgcFT695xP8WdnoXZh9t+jtPgb44ZH3kJFKdgb4PZ9zWG/rHny/r
	+YoSk31nDuIwLDVNL5bGwg1GdJyGLKk8YQYxLY7E2UdF9m0fYCrI3hw1bbsBcvbPzD9dK7ik7wI
	MzRyXDdGSFO1yrHukfCf0j6gkhyepEPLVAJphiBNzO0sq6sefr7ThBrWWPuvS3fcxo30mESyu7P
	JEbHofiMUtjceoPw7U0i/mcJs9U5NBEqFYc0OnoU5/oqqwyhO1dYAi94=
X-Received: by 2002:a05:6a21:178a:b0:3c3:68a5:50c8 with SMTP id adf61e73a8af0-3c90d6e9458mr754410637.71.1785424260206;
        Thu, 30 Jul 2026 08:11:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:178a:b0:3c3:68a5:50c8 with SMTP id adf61e73a8af0-3c90d6e9458mr754381637.71.1785424259800;
        Thu, 30 Jul 2026 08:10:59 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm34502171c88.5.2026.07.30.08.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:10:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
References: <20260728-mac_phy_caps_parse-stride-mismatch-v1-0-27a9c1a3fbd0@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath: fix stride mismatch in
 mac_phy_caps_parse
Message-Id: <178542425857.3503956.13658873020140475290.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 08:10:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX7PrKTTKsDuLy
 EtrnRAmNZMXryW34s1zlvQKNMO1WMovaPXiv06+07g4xPu7m+HDvLSjIhby270cw9+ZgZMfPKAV
 RWIvySIya+PSNZB0FmYauJ0HLXTL+c/xxSik2sa2OWF/Kw7c88iPy2cpgyeH/jSllmrgmq1AYOe
 z7ugzG+7dt2IoT/p7qdV0FqNZd8UYyFpHyWowPzOA5gzUe7MA99cEo0r90H/KF+OmOTBsQ3vbll
 /eHPmfMZrdDdB8oinZpdLuYobARGjUampm/nuLlnyOpaEBx9Q0lTU9nCKD4qztnOOQJfkYRGWsY
 M7bDP+WOi+LTQgUue9PAWE2XWX6ZF/9oCDEinTefJZInOb3EdY4WzMrvQPmsnz3Z8dkZvsD9vHP
 4KIBE2Ai4ht5diQnlFVCwcR19h7ShyHLwua4vgouysdeLVfG6RmZ6w5J3TOsKKfV4DmGSMyvOTi
 jAjywGSplsNzebx0KiA==
X-Proofpoint-GUID: LrFbJatEvmSyrbjhYQ1dckpxqGDNAHGc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX4Swhfq2XRJmI
 HeiVhG9kWAXii1WWPJ8ZfxPBMiKCY0Y1/B7w0aQuJ0YU3zCzYuj+zD1uqZKCWDHN/OKnl0Oh8h4
 KebMLFtanI6u1btqNICo5TGIWurmLpA=
X-Proofpoint-ORIG-GUID: LrFbJatEvmSyrbjhYQ1dckpxqGDNAHGc
X-Authority-Analysis: v=2.4 cv=WuQb99fv c=1 sm=1 tr=0 ts=6a6b6985 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QOL9NQ9GI3QxS5QxDNMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_081102_439721_34034F95 
X-CRM114-Status: UNSURE (   7.77  )
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


On Tue, 28 Jul 2026 18:05:27 -0700, Jeff Johnson wrote:
> Both ath11k and ath12k have the same issue.
> 

Applied, thanks!

[1/2] wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
      commit: 4c6eb712a91fa079be6f9f1419c96e0ad2227081
[2/2] wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
      commit: 7a246c72132eb943b5844ba79dad597b47429dba

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


