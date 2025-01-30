Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1391BC02190
	for <ath11k@archiver.kernel.org>; Thu, 30 Jan 2025 10:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RgLfeumhAMcdpBwtnBaJNUgMXiB2T0sXRwKTkomGvqQ=; b=ArF6AKs4BzDXH7FI5Mk/FPG+w/
	i7XkPZbfTc2KVWdZMPhf0CxuZ8O1c3GjOfPVUf+iXIDu9YHnadGedW8bBbSdO3boaq/zn5NW4uyXq
	OdgQxgPLTHf/d2UpXVC8YFAnTh52Q/KjB2k9U4KcCcqSNhoeIK77WBvCsSpEMnxEq8zyKRGlgea/2
	u3S7JSVxFRVeugvUbmS0N7207SUN90uY3yL7wak0rNr7Hb5TLY8lJXF6WIuiXzY7q0TqueMXhDgsA
	GQULs5VLjOrM+HCURO3ib64b6fN1Xmy5hiOhfyCHSIMNg+gW+PTyZcxHiDTZdNOsD5200i5FlwFrx
	NzO2ioIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRjf-00000008cbj-2JAi;
	Thu, 30 Jan 2025 10:25:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRir-00000008cVK-1sIG
	for ath11k@lists.infradead.org;
	Thu, 30 Jan 2025 10:24:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U9LWJS012290
	for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 10:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RgLfeumhAMcdpBwtnBaJNU
	gMXiB2T0sXRwKTkomGvqQ=; b=THoyluZ5rb3umqXEW8Fkw5ufFCLyP3d6BQFHdZ
	mvRLrrIiMuf+Iuf/zOzdNGBnd4YhO2EVRmgkDPgdOQibbDq74THSfk7H46nVXYK7
	zb45rn45jk5QsQvVjzoZJqB+xe9eScFBFPN+sS+unt21/F8wrxuPBARxD3iCE9yA
	Cc+IYMpenLkaVUNiOzjITSDV+T0vrnviDOXP8mmZ7iJXcOER9tom0wnv6tVfH67o
	D6V+1omayVCwyTkWWiW8GnsQjLXXZNS3DwrpaH0TFQEemEnAHB0BDyyho+kaRlcN
	Rc49LElYGEKw9dSQn9lLjC7x4pgSGTUrHLMSI+ZEIm3/T7lg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44g6q9045r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 10:24:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2164861e1feso13707975ad.1
        for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 02:24:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738232671; x=1738837471;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RgLfeumhAMcdpBwtnBaJNUgMXiB2T0sXRwKTkomGvqQ=;
        b=jGDhnKNPRPZ5hA6Lqwgtia1WNudx2JZnkJ/B56SU8i6DsJAw/nbRbqCTc51QyTZ/Si
         o+fptaZ9+Dd/8ub438h/L+YVhNXOQlF8MQ9WLyJZQtyKo0NQeL23H8XSgg7D9aAjU8oh
         +479OlT9mCJ4mfEeqyVr/ZCLkZH6Cnp8hO/FGl1B1uuxhedHEw+oHPJS44yyZMKK+2Qh
         LKIEttZ3EvpTVUWwZQlHHXDPWKtPWpPWJYaDBTVwwOjsS9HMjY+2I11EGbDo2f/caF34
         TVif+9QkQQn04Wb5gUfFqEIVu4djtmGFvY7SQEyJYbNe8k3DcCtT7AJtjGWldOSyIYgb
         L6Ww==
X-Gm-Message-State: AOJu0YyHMnS8TaP9Gz/0flP88DFgDue138CFPo4SQISxGb/yPtXqKtma
	damrOhjoEpj9/x2H41AzHzPfcaQP4Ud1eecvDT6wUex4AKiVfD+qG7sQW+noDTukSt1FSkW5kn8
	Nzx8DLw1OjsKy6020F8pE0RqMb1FIMLeqDy+6tmleNUpwZ8Rk3Oq+VDOh374U2oY1oisM
X-Gm-Gg: ASbGncv5DYWzUGtPl1gMYYB0HCAh7T2qJta6TUkKieMNB5n7C2Lzr88lBAoo2vgdUie
	cDaQdJj/9q8AL++EKobJ/+UC2qIKf8h61DI9Q9gBznLmdfLPuMN5uu29aStcyNHTQemObaOYhZF
	FsobQxL9xTnWLXlrbp7tHYU+ux/dnh/+vmYzeCZk1CVZImnIQJwtBa00GqIn3/FpYBe/hpqQ/7m
	ax69lv/zEkSKYJJDfEy6rCcr1hWRclMjIzWgjS2ZbvHcOxq1A//H/crjMpTHstberfZ3i5iW6Vm
	WPMqKWQA8GW8dM6hAAm5R4FzepJb
X-Received: by 2002:a17:903:244d:b0:216:1cf8:8b8 with SMTP id d9443c01a7336-21dd7c67e11mr85996065ad.27.1738232671472;
        Thu, 30 Jan 2025 02:24:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLWc/LPfDka6VnDDOIdh0ESprgXHDEZzVURcaU76KgZImTzTle9zyyPFGoi1eNFoSh9LGY/w==
X-Received: by 2002:a17:903:244d:b0:216:1cf8:8b8 with SMTP id d9443c01a7336-21dd7c67e11mr85995825ad.27.1738232671053;
        Thu, 30 Jan 2025 02:24:31 -0800 (PST)
Received: from [10.152.200.95] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5fesm10606385ad.132.2025.01.30.02.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 02:24:30 -0800 (PST)
Message-ID: <a703094e-b38a-4d45-bc2d-4730c6ed59b4@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 15:54:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
Subject: DMA map error validation issue in dma_alloc_noncoherent()
To: iommu@lists.linux.dev
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ALljDQs-OSmxYY2BwD_OF_UO8-RDSLbw
X-Proofpoint-ORIG-GUID: ALljDQs-OSmxYY2BwD_OF_UO8-RDSLbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_06,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 mlxlogscore=835
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_022433_510756_DDBC1CFD 
X-CRM114-Status: UNSURE (   8.90  )
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

Hi,

There is an issue with the dma_alloc_noncoherent() function when it 
allocates
buffers. This function internally calls debug_dma_map_page(), which 
allocates
a new struct dma_debug_entry for tracking each buffer. After 
initialization, this
new entry is added through add_dma_entry(). Initially, 
entry->map_err_type is
set to MAP_ERR_NOT_CHECKED. It should change to MAP_ERR_CHECKED during
error validation in debug_dma_mapping_error(). However, because
debug_dma_mapping_error() is called before the new entry allocation,
entry->map_err_type doesn't change to MAP_ERR_CHECKED. This causes the
warning "device driver failed to check map error" during 
dma_free_noncoherent().
This issue is specific to dma_alloc_noncoherent().

The flow is as follows:

-> dma_alloc_noncoherent()
     ->  dma_alloc_pages()
         -> debug_dma_map_page()
             ->  dma_mapping_error() -> debug_dma_mapping_error() 
(update dma debug data structure)
                 -> add_dma_entry()

Possible solution:

-> dma_alloc_noncoherent()
     ->  dma_alloc_pages()
         -> debug_dma_map_page()
             ->  if (dma_addr == DMA_MAPPING_ERROR)
                     return
             -> add_dma_entry()
             -> debug_dma_mapping_error()

To resolve this issue, call debug_dma_mapping_error() after 
add_dma_entry(). If this solution is not suitable, please suggest any 
other potential fixes ?.

---
Praneesh.


