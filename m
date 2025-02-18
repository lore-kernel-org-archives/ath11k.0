Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED31C021AA
	for <ath11k@archiver.kernel.org>; Tue, 18 Feb 2025 17:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlnSOaDSXn0NtKzNz9APdxJBO8zlTW6fZC1nNG2pCBc=; b=SokDu7o8fl9MQWaZBeOf8ucpt6
	UZJ1w0IwqVMj/e9zZTdttmKVRUetq2Sg4CBE2MhmiEfwCRlJRbyvlY1/UhDLorpsIelciSMrOHqVy
	ojoO7cHFeEAW2kV9WraXEVqVAaWtVZ4EfT66RCjifkqqpCJj1pt0ZZavz/myNBVUy5r1xZ5LefnLE
	7YTfUZ+WjGNNppiaKay6v5X2sFKh/ANZa0zm59kWHTq6WMm2yjxnS6KGIzD6JSe8O4BOYGmrPvA1r
	pRAK9KS4YBBF7cCJj/vitwist8qHWKeGcCVABw968uRWUoiO/gKGfRWAggkH2cK6EL7vaV0Ozgoic
	q9HBfsmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRpw-00000009Fa9-27AW;
	Tue, 18 Feb 2025 17:56:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRpQ-00000009FU0-1P9v
	for ath11k@lists.infradead.org;
	Tue, 18 Feb 2025 17:56:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IBuwf8025483
	for <ath11k@lists.infradead.org>; Tue, 18 Feb 2025 17:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SlnSOaDSXn0NtKzNz9APdxJBO8zlTW6fZC1nNG2pCBc=; b=pYd3IMp/N46/Iqyl
	LElfUDDxjujyHi9BnaalR4e9KrCaqLUj3xunFcDMx76wysvMfmTZnEYwVKZhDIny
	kRVl5dkpUB3s44JL2qH2VQq/z/MAjg1b9TfkPaNDgCSwaRz+W1iR5bWj+BQy5Ty8
	yoCHt8BAnHpkqPKciZ0/AOLZ7ufZjT8pnuoMmi/2wjxZPyG8aidseUlqRBe54ubE
	psWnboQFIrToBNYZ5ZMPsJgf+J2+KmNNr0fSpNIuLfpwfZmtzhIYrnsZ77PiX5S1
	L/qHMCewfWDoaABaTvfFsgYec0iBgpU63z9+XYfyVrcl0BJOAXAD68dMutdT7bs7
	eJ83lw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7vwq2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 18 Feb 2025 17:56:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc2fee4425so13647031a91.0
        for <ath11k@lists.infradead.org>; Tue, 18 Feb 2025 09:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739901373; x=1740506173;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlnSOaDSXn0NtKzNz9APdxJBO8zlTW6fZC1nNG2pCBc=;
        b=mWkIYkAe6P6kYQGj0L92Ks/hB8AozFkE1PR2foRnOQd28054zfis6keDmkwdbLiGg1
         7XrVIM+jSoungJ4MLAcn4FKpJYpmykGE0kt5o9AuiLkJ7dtKW6FaBAs6QLGJHtvZcCOr
         698eL9Dmg21uaq/ojOlw151/4dtkJgSOaGGotRhb//WuNmbujU/V+BHSgDvMIGawFQoW
         YxwFuZ+jbRWtZbYAA4SwlSJgx9k7//bkgIpJPcP8Z9wKpsvKyZzky2FbjFfYQf0kgbNY
         JcB0v91rquVktyBDsCfXqQxvQklSe4V34yd1y/yEbqB7dmjzxSiDodheNhi+QG34peCq
         dihA==
X-Forwarded-Encrypted: i=1; AJvYcCWipobd/v3bTzrYzAfBBitpYIAXT1SfJSMi4IRLKS7phh+k4ye6yQD/jC0OHUPfld7VU07xCJo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyX2wGbIhA0vT5GOFvaxbrP5E1TA/mVACIaBU5Tvme2Z9uCdhuJ
	hsb5+Vg6fqaP0f6AHcYVj6OOgrYCaMRPRaQ/DYT9iB5sScvZgP7IkLsvMihHMkZ94lZTPi0Hax9
	g7Bh55IJ3+w+gw3B6+epvNDalSf/qKToJwYk7q7EYq9HFFvT0+OdMiaajmWfG
X-Gm-Gg: ASbGncuEP3JKpu7gWqnm31zlU9AyjrZhrMyaI5tXd9jtpWA6pGhWFv3LG1qCBhrr4yp
	YItbwfqV/F7ATgpUhVvLwE7h6hv6+z+HCU0oCqAoihzwPXo3ETO2NqwUXTermKhkX+3s+6iuNAx
	2Od7CNwjSKLpVYTaIAH2SuQA+ho3Dx2jaFYa1DVVhe7Qjng4EZgP/kfnQMfBEtQNwDZQ1OF2QW7
	MGJdau0+tNEdxnHVx3xe3L/Gffj4n96zA5X87a0I+7R3shpYI8j2Jna+le8KEpJ4DpP7deb427k
	/55EK6z/5QsPngLgf660KrWzsPJeXp3my4oEg1zu8g==
X-Received: by 2002:a17:90b:1a88:b0:2fc:b40:339a with SMTP id 98e67ed59e1d1-2fcb5a14827mr566132a91.10.1739901373168;
        Tue, 18 Feb 2025 09:56:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGM5rwFrhFmpIpr4cmPu76+PjEvtmbwtIZiH1h/ZeETkoM1xFjOrBES+zW45GQ2op51TGo1Ww==
X-Received: by 2002:a17:90b:1a88:b0:2fc:b40:339a with SMTP id 98e67ed59e1d1-2fcb5a14827mr566101a91.10.1739901372819;
        Tue, 18 Feb 2025 09:56:12 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f698dsm12342252a91.28.2025.02.18.09.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:56:12 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: kvalo@kernel.org, Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org
In-Reply-To: <20240813013028.2708111-1-quic_miaoqing@quicinc.com>
References: <20240813013028.2708111-1-quic_miaoqing@quicinc.com>
Subject: Re: [PATCH v6 1/2] wifi: ath11k: use union for vaddr and iaddr in
 target_mem_chunk
Message-Id: <173990137209.1304166.16158310748083634336.b4-ty@oss.qualcomm.com>
Date: Tue, 18 Feb 2025 09:56:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: vyw8dO0ki4ngobp_nWVYUPr7ieMZZkig
X-Proofpoint-ORIG-GUID: vyw8dO0ki4ngobp_nWVYUPr7ieMZZkig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_08,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=849
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502180126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_095616_580278_D2539A9D 
X-CRM114-Status: GOOD (  10.80  )
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


On Tue, 13 Aug 2024 09:30:27 +0800, Miaoqing Pan wrote:
> The value of 'ab->hw_params.fixed_mem_region' determines that
> only one variable 'vaddr' or 'iaddr' is used in target_mem_chunk.
> So use an anonymous union instead, easy to check whether the
> memory is set or not.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04358-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> [...]

Applied, thanks!

[1/2] wifi: ath11k: use union for vaddr and iaddr in target_mem_chunk
      commit: 9ee2578c343a2c8b6cf6c43f2f385cdb56a25250
[2/2] wifi: ath11k: Add firmware coredump collection support
      commit: 5edbb148bc57295a6abbb31b832878c0725ed10a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


