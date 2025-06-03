Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A13CC5AE59
	for <ath11k@archiver.kernel.org>; Tue,  3 Jun 2025 23:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vC8D0+Kj4sSwmy4nTAOX+3nnZ5SU4Z2YYaYDBCex6U=; b=t9xhuZ/S8wDoNVI4fQjQPPLiDS
	hXnPLdZukpkpA8XCqP/DTaUPUdHZp9N2mEAjrzBJv4xTg2PHuZ1Nls+RNSSxp85oE8wTUoY5eyUIq
	RSmIKH089OccswsPEc5Ak+zjXqXtgMcBv59aavPi3psJbxmG+LVYXguj2VY2yykEnHLzVEPK01lrx
	/DF5vUkaSDqZo93SzAJwXHqlxkIJR3jixSJFiOlU1X55h7JZfFzDDf+LhY4v5Of6ifyeRM/AGTWAW
	Laa/mwoWoC3r8O8++1040e8vtIZZ9D23xF0Taa31evuvJzfT1deGnl9qFv+GzKwVIp32FzSH7grrV
	MHWo7R2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMaw0-0000000C0ZY-0tNf;
	Tue, 03 Jun 2025 23:20:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMavx-0000000C0YR-2ZyG
	for ath11k@lists.infradead.org;
	Tue, 03 Jun 2025 23:20:43 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553K1rIF000695
	for <ath11k@lists.infradead.org>; Tue, 3 Jun 2025 23:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vC8D0+Kj4sSwmy4nTAOX+3nnZ5SU4Z2YYaYDBCex6U=; b=cReK5JVJjhbm+tAC
	0WDDu4cYn0Ts+Wc4KrEW2ISlMi/4FIfTHHj/SL0v1adh5hdnOUQd8xo3hMZm0w32
	u8pTUYNI8/O6t+8mpGWRCgoteiVi7Znv7DmeGc62U1odwt7PmlYUu4EVbz3+qsI2
	d8Sk8NP0LnZZrVNQxoIgOJpcA3OBOHUxxHlWqlPM3wrSjFFfUYWvkrn2QXSFv7q7
	BAsCouQlzajrrWkbJC58A2IG+LkWE/GJh3Mb05TJS5wOyeGhWLlNVf5LGn/diJ5r
	48MNuXAS5Z+83mkTY+tpb2Xsx/EpRPzB2hA+Fw9foE8K4CrA0OYZbkZJdCi2ii8V
	qmtmLw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q45hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 03 Jun 2025 23:20:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23592f5fcb0so35675725ad.3
        for <ath11k@lists.infradead.org>; Tue, 03 Jun 2025 16:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748992837; x=1749597637;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vC8D0+Kj4sSwmy4nTAOX+3nnZ5SU4Z2YYaYDBCex6U=;
        b=wqMY/9lenD2fauj2/btIa4DrIDrtqzRKXCL4aJ25BWSHxCINpqPFC2G5ylQy78PdDg
         RLxY2nhN2MN+zXUGLIJ2QggvqRNGY29Oa5zKdsYPzqfSefM7rJhXLCyxaHHzW0XQpemo
         D/gCWH3XZLxJDg2dOIssLIqW3kF2Rh5Uzsppsn9KILYNqUee9h/2kI0+dHrIQlQ0XdHu
         IpRdzOO1knIlXD+IPDjPCqO+Rp0gXVSVfO+06646Z1WuaKTNljnwLLkxL42mBIiPDJUv
         w4mqYP4Y7n0xvGJppC7aw5+CUevWLAfMuC2gjz6PnI9h76UYshmPSdO1+8Gpz2gCT5nM
         S2TA==
X-Forwarded-Encrypted: i=1; AJvYcCWdoBSAtv7OJVeQ9twX5EB644JRE3ZAnlPEQfCLSzK4/wtDpzPd2DBUWCGZKgC6uDr+KMYd/bo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyGgEn+4yQ+7iTMsRiZZhRz+SJxwg4uh59/4yOMcMtVgJqJ2BzO
	GXXZjNhqDSI5tS2vxfefpd1Pw4hOFsGVLi2Wt5A1EVKum7B0zz8C9S6Ev5TnlViR5b1S87IYK/d
	86+LpMDCkFrFKupVav+ox8HSzCITtnz1PaspjuifoFrjLMIKNjZ07OMcXG7B0Ebur
X-Gm-Gg: ASbGnctvncz42f+d1smvWYT9w4D6sZiD+LFBztbHDzX1EK3+44SQycubFOKNESzWNa/
	anTqt8Y7/sLMqcqexar7iSHUOrq6b01rmnL6dZi8EljH1//dERM/zDpdlE8jWOjqVahTOoi740d
	IC0praCx9DhNaxuDfqqEP8Fdx7bm1/KHNcCa2QtkNTe34lisgwcWV4xacmvTpzZ0xuHKctDRA/T
	2m4NI/AkSa7a4nJmJtr8zORlOwg4Q/01wnPxvGAryrubM8H/CCer/+qdH1mKfKEIh5UuddxTG/v
	ynABEfuDkRGiSjxGIdk6g1Tt0MSYkpxq1USB8ADYN1lTZ8y5XI6vEFVYuthVa7TwMHKl57we8Z+
	TAZ1n
X-Received: by 2002:a17:902:dac6:b0:234:d7b2:2aab with SMTP id d9443c01a7336-235e11c0314mr7729025ad.14.1748992837237;
        Tue, 03 Jun 2025 16:20:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvZE5Q03u7FYFP6DR3K7O9QxJPbPAunMPtwL3P7zckuubV68DFLTnKndy+fSYrjZjFfjekJg==
X-Received: by 2002:a17:902:dac6:b0:234:d7b2:2aab with SMTP id d9443c01a7336-235e11c0314mr7728755ad.14.1748992836834;
        Tue, 03 Jun 2025 16:20:36 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf47c0sm92280135ad.175.2025.06.03.16.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 16:20:36 -0700 (PDT)
Message-ID: <ea4ac3d8-b467-49fc-8bcf-d4719d7312ad@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 16:20:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] wifi: ath11k: move some firmware stats related
 functions outside of debugfs
To: Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250220082448.31039-1-quic_bqiang@quicinc.com>
 <20250220082448.31039-5-quic_bqiang@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250220082448.31039-5-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iqYjyVrGiX3Ait5IStALM8kzMvwd1MC9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDIwMCBTYWx0ZWRfX00HRFCYgdhWC
 2hCtTP1gzNuHqGoxG70jCNwHW49X3LeQjs8umJfOYmsFgUaAk55NijOYpmlEhJ/3UBFz+kcpbKI
 Ci1OD5ebFFN4sM8oXy7DoFypPaz/27M9Z8kcte+VkdeLsiiSyvcRr7IdMNSUoJo3xBRfP9iVuWC
 AEQyBYYuY5AYq30+wmx+FwuQ4Yd+uxaSh2K05OMYbCFJ8fa54pV8wetpUfj/80eb1E9XpJraIme
 r6dqgwX65KLDeUvYYrhAod9l+Am0bEgJdfpsBM5YDle9WhXI2fWo/mW9SlU/kHeOjur2oQPIBCu
 t20IeRq6fZGbhKywtHhr9VmqgEqKxMjK3J3gZm4STbW7ZaAMg5dy7pH/Tw9S/1leHaweSro2IEb
 R4G+F2f9RrDko+03BJw/qFRcbdZf/pxx0FlorLS+A6ODaGk6kTBn+8WGYRUiW83ym8RSu7Jf
X-Proofpoint-ORIG-GUID: iqYjyVrGiX3Ait5IStALM8kzMvwd1MC9
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=683f8346 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=Ub6YIYI0a6To4LV50ygA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_162041_794231_003AE182 
X-CRM114-Status: GOOD (  11.38  )
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

On 2/20/2025 12:24 AM, Baochen Qiang wrote:
> Commit b488c766442f ("ath11k: report rssi of each chain to mac80211 for QCA6390/WCN6855")
> and commit c3b39553fc77 ("ath11k: add signal report to mac80211 for QCA6390 and WCN6855")
> call debugfs functions in mac ops. Those functions are no-ops if CONFIG_ATH11K_DEBUGFS is
> not enabled, thus cause wrong status reported.
> 
> Move them to mac.c.
> 
> Besides, since WMI_REQUEST_RSSI_PER_CHAIN_STAT and WMI_REQUEST_VDEV_STAT stats could also
> be requested via mac ops, process them directly in ath11k_update_stats_event().
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> 
> Fixes: b488c766442f ("ath11k: report rssi of each chain to mac80211 for QCA6390/WCN6855")
> Fixes: c3b39553fc77 ("ath11k: add signal report to mac80211 for QCA6390 and WCN6855")
> 

if there are no other comments, i'll remove this blank like when I merge to
'pending'


> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

