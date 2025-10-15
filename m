Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19F9CCD185
	for <ath11k@archiver.kernel.org>; Wed, 15 Oct 2025 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlmsSHrLJYXaKznqs6bL438Vt/4Grdh8SIvj1W2VJP4=; b=jDdLDjl2Hw4bSKpsTlShzwTKfc
	J2OUmPnbY90c9ktyGMF8LxHtKJBcR9NieKnTq4ZvzKeW7gSOY0fSYMLRs1dHmyijzdyZ5P25z7x5B
	QESUivGFCruX6dArbbirvlQqZIHeWCwzDXmNnZTP1cjGMRW8YGYaEE8Zh4w3CoSpLy9tlElWren0a
	HghrXAN1EGZpkFbnL5y/mlIanAhFu4ybCW3EpeKgAax0Op0qZ95e2LOckB5Oll06Xnk0Wr2yZ1Uhc
	DElBrfIEMpKGsYJK9Gy5w0MJ7LVwRZcmnfviF6NEReqga4/vrpOV1lN8DD5rHjB0XSP7zHhmrd1AP
	IkZP7hpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93fD-00000002967-0oWc;
	Wed, 15 Oct 2025 15:43:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93fA-0000000295Z-1g1U
	for ath11k@lists.infradead.org;
	Wed, 15 Oct 2025 15:43:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAgnUo009308
	for <ath11k@lists.infradead.org>; Wed, 15 Oct 2025 15:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlmsSHrLJYXaKznqs6bL438Vt/4Grdh8SIvj1W2VJP4=; b=F2XkscGFHATu1Yof
	Dffmk1QP5JkTyGJIGHCX+Y6S9dlWf3L8oswHkgXtOcUjv/jEHsmRnvQb/lM/Hxfd
	Ap1FqKew8Lp7xXVkAtdARH0L3TlGl3p4QwZqOrUQ6pWcWUW8w8URvEvM/MdZeBGJ
	5h+9m8+eR88ADkLByTwZWdNskhdS8I988GyK0/E121R5HBTKVSZ4U/wiz40gEHzn
	DPqkU/bOAveLUvxYLw2A9FANVbrgBkS18qcrk8dq5RDDzeoP7lFPUwT7Xd2caFQf
	tDVr2arK2n/7VH9RWOkRDbiH0I0NSVW/pw2T02+KjnOT8AOLXDtim9HZPpE2KGoH
	aBJaPg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c4vyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 15 Oct 2025 15:43:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b609c0f6522so17934876a12.3
        for <ath11k@lists.infradead.org>; Wed, 15 Oct 2025 08:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760543018; x=1761147818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlmsSHrLJYXaKznqs6bL438Vt/4Grdh8SIvj1W2VJP4=;
        b=HrZXLeaNa6LIEksuknH38rk7crZRdI5BQEWSbFnj9wDgrnjXUUbuJIIndsHkU9xids
         1OD8CftdCgWcYtHUw3ZvxEv6DfqXbpKmF6JD2EcYUWb6ox1aN3R8ybMGHFosQnIT9eJR
         h8hke58O2YYl8vav22AJc78XZ9MGmX+YDE6HD/ocny23dcEha0qPY5XeWz8StMji9zsE
         kVpKcEgkDHlH3EHB0v8JzKUyKccMLSw1P5utbm42RCZd3DASMs6el+/p1FZWrQAR5Yi4
         xc3+2q65LltiwswjoDuE7EPDPRTNCtCrvZsvNLeWydyDs5sCnpBwRWozGKvNe6W/kgGA
         XtWw==
X-Forwarded-Encrypted: i=1; AJvYcCXlBd1OfA8digH3X7fMH/B75j0cN2h5WypLd6CuSReoLyC3NFU1wo0c0ZiRXuwSxiG0g0FJOwc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyD0SIbgMbV5EUm9YVuERqqLVbeHMtgWLdwEC0ze4I/pdiLLDJn
	qIp7pVAt7EiRVI1ILbTaFdGa3lzy1XcxPtlyG2uUL+jyrD0wqu1FDa/+opA7cOYKqA/pqrMNaTG
	AcWLl7tnawtXna1kyf50FQVbqfJikI9WyKqSRpSoNF2h7fviiOPwYOrjU5TKmF6WaD9DSwRgH
X-Gm-Gg: ASbGnctPkH/c+b11Fv9Sns/nJq6ABKfCqkBac8Jn3w/NiiP9RG4zQk0GVcViUjBCX/K
	x/GS6jUctqeQGlJWAjLJaQMbOFj/lWzk3XeP2oR22l0vHAB/5su1Mqnsn/Qw6EOWp+zxmV7E33J
	HjHwwX9sBGRhkV7lLZHgrKuTH0VDrZLrrtkPApeUo67kvYlRxGqI/XmIBEl5Ym7qYlTLT9j8EB4
	/naHO8FNAtsZpotGgATpyc73QKicpd8Z36r8UDF0eSnGo6CT9xxM1ZQonuAPoo7J9TWUG8wdKVo
	d7gNjmS6Uxnml3VbFaYXkVhtGs8hgllCnicGhftFwxXEFsj5len2O/A/uQaOxvNjPFWHz2j5xqX
	GeJosUMqIEjXrn4TC
X-Received: by 2002:a17:90b:4b0b:b0:32e:a535:4872 with SMTP id 98e67ed59e1d1-33b510f8f79mr35812698a91.2.1760543018362;
        Wed, 15 Oct 2025 08:43:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzxSFXoULbOdZeQn2+c/zLnbkN0JS7GXtiAGLzcTxkdGfgAibXxaQEbKeu/7KLUzII7AKu8Q==
X-Received: by 2002:a17:90b:4b0b:b0:32e:a535:4872 with SMTP id 98e67ed59e1d1-33b510f8f79mr35812679a91.2.1760543017894;
        Wed, 15 Oct 2025 08:43:37 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.230.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b97879fc7sm3021860a91.17.2025.10.15.08.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 08:43:37 -0700 (PDT)
Message-ID: <f60950cb-c66a-753f-d657-e76b6c63ee10@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 21:13:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath11k: restore register window after
 global reset
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20251014-ath11k-reset-window-cache-v1-1-b85271b111dd@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251014-ath11k-reset-window-cache-v1-1-b85271b111dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: inLrJWNjFtCxhjDjcgucM2byN3VxITbP
X-Proofpoint-ORIG-GUID: inLrJWNjFtCxhjDjcgucM2byN3VxITbP
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68efc12b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ywaSrutoL1r6B8MZccleLQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0ta-gCHYuXx5BB70YVgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX5qNK+FE54RO4
 4lCQeaVjbaVWXGGYAmdwj1EX6W3VcoZ44iG0NrQPDAA6J94LOYnMJf+08UaR/ZOsmDE/wcKXFE7
 bFAysUtAP3M/9kFG8EDKgkfEW2bu5thFMXQMHH3HRTXinm1cdRo3tW8AkHyb/SCQvpojIs4w83n
 Y4z6Chy5EzF3yMyxvEq760c9568gztWSOI+6P2HDz69xzSH14WiaI0AbQqATahNQ6VS366xcnV4
 byK8Htta1bmfi9XKGWDapEuKUuF6m3xK3c3AgjXKxRLDOW/qbYlI1SaB+CCGu5YrwiVZQ3eUlwK
 XV3Y5bOP4roFAE4n5aBTVUwPj1UeN4VE0WsTOdFiHLtCup87epnU9HRNtLkvETzNu9NNh4J5/J9
 C0Ixj3N64EwW8Z+gZtYPDHwiKFGIQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_084340_443147_A27A5958 
X-CRM114-Status: GOOD (  15.62  )
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



On 10/14/2025 8:00 AM, Baochen Qiang wrote:
> Hardware target implements an address space larger than that PCI BAR can
> map. In order to be able to access the whole target address space, the BAR
> space is split into 4 segments, of which the last 3, called windows, can
> be dynamically mapped to the desired area. This is achieved by updating
> window register with appropriate window value. Currently each time when
> accessing a register that beyond ATH11K_PCI_WINDOW_START, host calculates
> the window value and caches it after window update, this way next time
> when accessing a register falling in the same window, host knows that the
> window is already good hence no additional update needed.
> 
> However this mechanism breaks after global reset is triggered in
> ath11k_pci_soc_global_reset(), because with global reset hardware resets
> window register hence the window is not properly mapped any more. Current
> host does nothing about this, as a result a subsequent register access may
> not work as expected if it falls in a window same as before.
> 
> Although there is no obvious issue seen now, better to fix it to avoid
> future problem. The fix is done by restoring the window register after
> global reset.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

