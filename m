Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88927C19F32
	for <ath11k@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBqpguxGGsbuHVyIoyeYvAcOEVkUt7dp6bLQG0fntUQ=; b=K36fIwF8Wtu91noKV7eWhKzyCY
	PJG0M5ibS70DgMqCecJRvxO6ZoOfiyMou4UgKWjsOIK6JdEEQSC+vDYXiLkJoXachN9QmFI57qVNO
	R2/yto5sOWRmOWsItpsF/SzRmWd+GtS3a03mDSn751NNvjQOYYQHkNXVHsJaQ2q4z56Mj0azCxq0k
	4YlBYlgKcLoUeZtYwF0FcUJ/4b7OnU8SESH07CBK2MT31bLc4XrSku5LJVzv9GPneqNG25R1rG4My
	vfQfID5DOZoU83p798F75KdnDKGBEuAKdo5YI8EsdPYOn46IwraMT6nN4uQIlrPmtCWTdTlKNuBIG
	1emlOmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkg-00000008aRD-26hF;
	Thu, 27 Feb 2025 19:40:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhOy-00000008BFU-0kKL
	for ath11k@lists.infradead.org;
	Thu, 27 Feb 2025 17:10:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R8hfL4012265
	for <ath11k@lists.infradead.org>; Thu, 27 Feb 2025 17:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBqpguxGGsbuHVyIoyeYvAcOEVkUt7dp6bLQG0fntUQ=; b=BERq+M6+nBauRddH
	EEW4jz44O3mA6RP8mXiK0q7+x58Wp91sL6LI2Ywy42Y7jSQyzKBAAQlE/z/ibh+w
	UwY0z9dJLNhY+75yX1jU0O0r/4w/hWAnhWiF0dOvnxlhbRkMJ7HT1eFLyltvw5RX
	2f6iw3TSrJrlr5WXauV5NABby1uXa6Oxcl8JuuluDFlAgm+0h4LT5CMN5u0hJMAp
	O7SymVQHZuP/1tSUDlvV9tM4sCgh6zw7gXkd3WxYBOYoCzRVrCIXsuy8dsQ11c0T
	IBKTbtWIXEiFXao3g81e2abtsAvDVdZ9xZMi5TGDkHMr4A45Pfegx8RmFtj9ns9G
	BOnCog==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk6g97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 27 Feb 2025 17:10:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22339923628so32114705ad.1
        for <ath11k@lists.infradead.org>; Thu, 27 Feb 2025 09:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740676222; x=1741281022;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBqpguxGGsbuHVyIoyeYvAcOEVkUt7dp6bLQG0fntUQ=;
        b=SkiO731VhldiNsCf+mUZAtani0YHWFXxf9n3DtvoRJEwQex7rrrb8z0l8FKBzoMvjx
         sMg3GIlsB2lhHNVITmNQJm0xT4MEFx8qIj8g0QpnNM0rQReuk3UHTBJzBYgKiMuwcfip
         fqfbqUyTvC4xK5Tiu2dO+eJHIRYEfNc3q6UrQGfpHiUTnTNZbJCLfGNAXqnqTCgQ0t9y
         CB7NzPKHlOpXmTOeRZb/R0oFHjkE5ANhFBpLMs7k0HrTKz4dlcVZk2LUy0J9ScFkofBl
         a1QkrZXHa/tWoYPf5AktN+J1qR3DjtVKk9tCMRjNkr3dZ9CZNdeWx/n16dP8YICHHlZD
         bekQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdb9CinTYQqC3wBSQZVmJ9N0DzIgMvAOMJReMvcA6ey/nKCEPq1iPn58PX+uu8t41Hdnzx4x4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0+KqGJcGQfvMrieSpL/QuXshtr6KKJsa2inKLx9aAdIGG9g4X
	WMloZivc/xXWLLl/4mS/kSfvllmsb7sthZusi0waKtwFJZ5Tpr8RxLq4fK51p6xdVV5CylGu4eH
	ClDU57tvNnd6jbf7FbQ8/DRh/ij+97IrpbQ4vzYp4SY3zt41FuUsIeG1Y6O4CRYxBZWJ8
X-Gm-Gg: ASbGncsEjJDADh75UTWfMmPVH+uWNOh71Oy6elY5JCfgeG4a5qGSCVI/1viH8iywOIe
	2Lh1lIPnL+rjvXwb761JCLKiZjIMIU59YfKmT0xhTr1zvMoUodLtFzesozAVa36zv2qwWFaS5Mt
	f3rgGhjXbYrvTOK7G+/fVbx63fgO8BCb2cpxrEciUma/6GP1hoiEwBEi4EveSs3a+t1jpN2MUxW
	tJpIINDq1axkVBenMRADQtjN9ostob7F6R3tTQI0nQLr5P1nvJVifQ+O5/9qJP6PmSlPTHyQTUu
	pM0TKBXRgJ9tx1T9jV20X64m/z7kQ+cguAxrwTGiBv8kvkV8VuF4
X-Received: by 2002:a05:6a00:4c8e:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-7349d2f3d9emr8293948b3a.8.1740676220210;
        Thu, 27 Feb 2025 09:10:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAgr/wxwNt0KZqGBy+I7l36MHGLD404qGwiZ4rO8yQRGGh2MVohZXLl3ovVhLQ8DhfSndYDw==
X-Received: by 2002:a05:6a00:4c8e:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-7349d2f3d9emr8293899b3a.8.1740676219808;
        Thu, 27 Feb 2025 09:10:19 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe2a61fsm1896855b3a.8.2025.02.27.09.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:10:19 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
References: <20250225053447.16824-1-manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 0/3] wifi: ath11k/ath12k: IRQ affinity fixes
Message-Id: <174067621913.3801911.12667754541994215143.b4-ty@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 09:10:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: Zq4IDHj3XTxFjZX-dw9PQtdz59T-aDj5
X-Proofpoint-ORIG-GUID: Zq4IDHj3XTxFjZX-dw9PQtdz59T-aDj5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=840 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_091024_334863_BB1C43C6 
X-CRM114-Status: GOOD (  12.77  )
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


On Tue, 25 Feb 2025 11:04:44 +0530, Manivannan Sadhasivam wrote:
> This series fixes a warning from kernel IRQ core that gets triggered in the
> error path of QCA6390 probe. While fixing that I also noticed the same issue in
> the ath12k driver, so added an untested patch for the same.
> 
> Finally, updated the irq_set_affinity_hint() API in both drivers as it was
> deprecated.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath11k: Clear affinity hint before calling ath11k_pcic_free_irq() in error path
      commit: 68410c5bd381a81bcc92b808e7dc4e6b9ed25d11
[2/3] wifi: ath12k: Clear affinity hint before calling ath12k_pci_free_irq() in error path
      commit: b43b1e2c52db77c872bd60d30cdcc72c47df70c7
[3/3] wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with irq_set_affinity_and_hint()
      commit: 6f2d839d11b36c630dbcad2c68613f15409de392

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


