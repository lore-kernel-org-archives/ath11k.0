Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC5AC0219E
	for <ath11k@archiver.kernel.org>; Tue, 11 Feb 2025 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iS/AMLx5WfTsuFmeMy00aDgSBpo96c7fJK4uXFuxMGg=; b=AgZLeEbFbbhYB+to2XsAAhGblg
	BvJueEES6epgFU5Is6l2pHYQoytTvJ5zFlkgZ8SZf9tqPqUI7orsslZfrIXD51QsgFgqEIljT8P8C
	18B1duihPbDxYT7QNr0p2/x1ldFFSFnMWy/5KascCmVRL4t4dm/JUEDfvowNQMiaIjRev/0dGiFpb
	laJlosiE9wpSoO49DA+U5DSixkNB5mo/kP+5LlHbwGJw7ARbwikFbdk9kaKGgSXD/wBCyu5Mjf0gG
	Eu/YbvRBfiWMs9icSlKE+sjFXsf/2rikn52Z2Nu4n5+TEADVFllwH0qPDM7EyN8nj/qz6FxiT4HX1
	WywhZLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkYp-00000002oNl-0WqO;
	Tue, 11 Feb 2025 07:19:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thkYm-00000002oNK-2yGA
	for ath11k@lists.infradead.org;
	Tue, 11 Feb 2025 07:19:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AK3LdF003521
	for <ath11k@lists.infradead.org>; Tue, 11 Feb 2025 07:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iS/AMLx5WfTsuFmeMy00aDgSBpo96c7fJK4uXFuxMGg=; b=UrCo7emBPws/YPfw
	DbmgAe5XvojHppPBrsLaJ6sqTBvDc2W//Kijk/OsywhSk71BE4cO1g+Qv2bjc+Av
	xG74oZMeQvfUObYX8qEpZx22hR6tIxb5PTQGNojPE0ceiPE1jzLO8qNvgHptSba7
	E9RlKVdwOQvy3UMrbp6zE+8FKHpoeGxho5rsk+caPZnLdaISaJqxdamD/R8cFEEu
	RvW0ct0VxSjPKz/rj63+VjGTZJwNIlD4I7gfRNHgR9YWzbCbfl5hyuGhEyUk+Stn
	Jd7bPhuaWLhdwJs2L0ZIU7kNtTa4AE608F3mIz7u/3o/SlLhJzs3SKnrePfS9zek
	sTNhqA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dypv48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 11 Feb 2025 07:19:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fa57c42965so5253197a91.1
        for <ath11k@lists.infradead.org>; Mon, 10 Feb 2025 23:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739258394; x=1739863194;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iS/AMLx5WfTsuFmeMy00aDgSBpo96c7fJK4uXFuxMGg=;
        b=ZDORvvX2kx2ejqm0w0mOhhjd1v5I0SHpyZ0ySnu3klC2Z7L4uJNn3mQmmchy/ONk8Q
         i0s4DvQ6gAdCGIrdVYrSjgqGAhYRyAWBXVn8Q3LP2ZZ0SzPmGTIcxvhilXN+jatliYkh
         zU4KcZAm8Cgr962mQCG/4Iavo7sUAi3G7v7rVkPdpRhY9eXX2YFcxlVDu/niU/Dy63Dh
         E8tODjLtFmaybe3gwdnpPxgarrtApHkD69M2DhxwsX8Iqn6tyyEgFBjlnOBWM/QEfSPH
         IlKFCDX+MFNrwZgQJNf2ZCyKvRWP7cMnc3rIUBjPPD22OcpIYhuWKw+mNwwPN1nI5B7J
         cO9w==
X-Forwarded-Encrypted: i=1; AJvYcCWAn791zlyJ/g68j+o+CIJuTzrRlM/Ym7Q6PsSgZYVSDOE5hQloIDkfXmSKQhqlS4jb0BDcqj8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2Ibk/we3+EKmS6JseWjzZwAJgQb7jkZWphcLfKfK/B9RYgMX/
	SLPQccxtt/tBXL5WmAMCAhRnfIBUIf3NivBB/CfzEA9ijD/um2Larqdqi7NL2WarDu+74y5s5k1
	Mc/ARDwv7VyNqkgNjKP77nn4J62Xh4ODqVdf1Q5vYty+YKnbGOsZiMYzM4Ekn
X-Gm-Gg: ASbGncuS78UaGPeU+iOFEcnLnlKIm8BF1ooVAR5ZCTCMeB1TO/qpFpBbZVrCoExScP4
	jWUg41KzYkdMe6j+A/ayRIOpTYbjpaSnTihJK0KRi+c+fJKLcn5Re+fPgxkPi7AFhpP1lSHlows
	MHn+JSa7XubRjZYNrxiTp8OvXOhuQ7Ai+gjkGuLgWrmUpMWyA8v4NhjS6dJNYcbLPxNfJSiTRMK
	pQ1EEVco+8o0jT07AcLdE4nIRzP7n7hgstd7AY3FB9cz17NuXpkawyyPO6DtMXM1/xEG8KA3yYk
	kHY8y2l8sCEGNFvVV+8PY0w79G723PIbb3puHu7tIlWoqi6YQSVy
X-Received: by 2002:a05:6a00:2d8a:b0:72f:590f:2859 with SMTP id d2e1a72fcca58-7305d482e33mr24822930b3a.13.1739258393648;
        Mon, 10 Feb 2025 23:19:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwqAq5l9Ji9C88x1p2Eexlw37essUckjr3xte7DxXx9hZFmyJ03MrvQumAt/ZQWvw6s/wvRQ==
X-Received: by 2002:a05:6a00:2d8a:b0:72f:590f:2859 with SMTP id d2e1a72fcca58-7305d482e33mr24822905b3a.13.1739258393259;
        Mon, 10 Feb 2025 23:19:53 -0800 (PST)
Received: from [192.168.225.142] ([157.48.123.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73094992465sm2587063b3a.148.2025.02.10.23.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 23:19:52 -0800 (PST)
Message-ID: <1c79a03b-3379-27af-693e-1b4a5f64c6e6@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 12:49:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] wifi: ath11k: fix RCU stall while reaping monitor
 destination ring
To: Kang Yang <quic_kangyang@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241219110531.2096-1-quic_kangyang@quicinc.com>
 <20241219110531.2096-2-quic_kangyang@quicinc.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20241219110531.2096-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HTAFT-JxWtcbAyK9Ghfq7xCvqwvg71uI
X-Proofpoint-GUID: HTAFT-JxWtcbAyK9Ghfq7xCvqwvg71uI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_03,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_231956_758881_58C06B2F 
X-CRM114-Status: GOOD (  12.66  )
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



On 12/19/2024 4:35 PM, Kang Yang wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> While processing the monitor destination ring, MSDUs are reaped from the
> link descriptor based on the corresponding buf_id.
> 
> However, sometimes the driver cannot obtain a valid buffer corresponding
> to the buf_id received from the hardware. This causes an infinite loop
> in the destination processing, resulting in a kernel crash.
> 
> kernel log:
> ath11k_pci 0000:58:00.0: data msdu_pop: invalid buf_id 309
> ath11k_pci 0000:58:00.0: data dp_rx_monitor_link_desc_return failed
> ath11k_pci 0000:58:00.0: data msdu_pop: invalid buf_id 309
> ath11k_pci 0000:58:00.0: data dp_rx_monitor_link_desc_return failed
> 
> Fix this by skipping the problematic buf_id and reaping the next entry,
> replacing the break with the next MSDU processing.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

