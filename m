Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223FCD2CE17
	for <ath11k@archiver.kernel.org>; Wed, 10 Dec 2025 06:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iRPms9B7iFzeDhFGJSewFfbFC3pyljCFjAM3tAMS7k=; b=ka41xvQodPyUoOMQZw/gPmbcgO
	+rupdny20cMpGqcEVC0Q9N9+ulfa0JxXPaWDWnIyWoCQpc9wEFbhdTh7iT2Oud+HJqOQhNjErMqg5
	HGeLoMR1hzxWVDOumqSe6q9smzyat8OP4XG6Lciw9/tgKRuozcs8hu9YBBlsD+t71Cmqxpnrdnv5P
	JVJKfyxYH1sN/SKXZz/gkVuGyIJZxmj63lwQHADBz72h4mfDHgD7fGCg2tyQLS07/iDr+YHOaikC5
	PekFr6NfJ8Rzr1siZjAUy7g+DNa0wUCfvdGgkm5UHwmiRwmhq/Np2xLdCa8LZOz5PCaph9S0EYzRb
	7l/YUXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTDyC-0000000FBBf-1wst;
	Wed, 10 Dec 2025 06:46:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTDy9-0000000FBBE-2oQS
	for ath11k@lists.infradead.org;
	Wed, 10 Dec 2025 06:46:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6DoW92460844
	for <ath11k@lists.infradead.org>; Wed, 10 Dec 2025 06:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+iRPms9B7iFzeDhFGJSewFfbFC3pyljCFjAM3tAMS7k=; b=j66zKzMbNlzNvZlb
	oQpMD+EDgFVwMGbouhZyQn+w2HgnbjCtaPG1lJY6+x4rEbRLSFZJUCMMrq/QS7Rx
	Eo+Xl2Gd4ylXW1GosPNvr2tQqE7aUkYE9Q+zuvs9bEFOWagX9nxEPiyC5Ngo2M6U
	wa9MOid5WSyRBjomTfP0yEDpdZeeJQB+yDQSzORQU8npP56QsLKFMz0LtAi7g7hI
	abQqpwpuVjg8znPQR4a21WcLyoycG3rBUz004keGCJyUyBVcBjvPrWsfQ8lgE90p
	DuziKmcomO993QojIEf8iwuoTA4SkNH0JUEXvfhHBcESQ73MK7WD+XrcEsWP5Efv
	7l3jKQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqu5aa2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 10 Dec 2025 06:46:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7c7957d978aso7314889b3a.1
        for <ath11k@lists.infradead.org>; Tue, 09 Dec 2025 22:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765349195; x=1765953995; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+iRPms9B7iFzeDhFGJSewFfbFC3pyljCFjAM3tAMS7k=;
        b=jeuFNcV2Q972o3ARs2IsfzFSZgzpxd/aukjHomHdkIU5f6lwVV0XvZlCxyiyuW7khD
         HJxsjvCRM6Q9vHlPeqsUdI22nNCgWBRaCm6KPJxjJ54XeqOLRSVszGpgyi60CzqyeJA9
         l/rQ/T0WTdj69YiA7pqYtHieWVmBFj6DX5zEmFhI0KZvCXnUxAucpHH/7W/xi7lv8r2O
         mH2q0cRnWn/vqYuLf2TUsnYJGv95RvVWZ6ea70Z9KzEaiuWh1lIvflZxbnSiiyz5+SHa
         W3wxHzpYTY2SgoRKOQYJUBuyly+iH4Q+WCTqTT3gXrNEIEkMslRsyXxp/qovPSDrxxWD
         jKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765349195; x=1765953995;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iRPms9B7iFzeDhFGJSewFfbFC3pyljCFjAM3tAMS7k=;
        b=Z/jUdPOjqWKC+qGHO24i25IV86l6P0LUWctl2GBbq1Lnw5i/bCbHt5+nza271bPW3O
         zQKTJkONWHa4K4IWHkN4ZuZq06x2KbEPlbppP/IYkTmdxAfsLlkisUlQaXHzCc7FuI+u
         7zgMd3aqaI2LHBeaKCf2PbjC6Bka4UNcFuYGjYSbf54H8Sr8y+6WHDJk5NGJgqT9012o
         MieX7CBuhZ6UJ4MLBmgq+NCXbDDit8iKygqYIwcPiaq7uzaV7WT4UwHXwLY4nBl9EEjw
         nKN3UJSjUIIUToP87y6uUEpHWBXiy6MSxdrbmEB0tlU7RKU1Ux63wDoYBTETi6aQ2sgp
         b8mg==
X-Forwarded-Encrypted: i=1; AJvYcCW+/a3acoaPb23Rsgu/Yx5TSza3SKCVa4azt5btUd18ihQPEjh50nm6jRyOkLKDbv3uYjOofAU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyfYqw/S9eiFjh/grQbryXMXVZqwPJzmTiOgPJS42rBpQCuOR7
	LVBeLNFqPfjQiJVgR67QHHfA34sRvGU7aZ3s65L3RfBIW+/DbvhUGGCNBfCu2FWndxS2M++QTju
	gVxW3I6+9Z4xe7WczgFvkSVzpgk1bI+RqRZihugPu3K1GcWt/pNc6jS2TknRFqCxDYUKtiW0D
X-Gm-Gg: ASbGncs4vwX66WnNfhfDTLyea3e+ilMOAc/FnRb3rordIWqfbpd4lkJ/oILuZrIksiB
	JfI60STEiyYCzQogAi2SEhSjqHvuJGaeXfCShi9WggzHIhJe5NYluD5aXVlgJCVDf1YfezwS/o9
	Cht+NrRSWD49CbNuBEHj4ETPkiNJVgiDmy//Oq/6MmNTInZOmflEkQ8jHkPtjxzB5vEjfpvaNoe
	vlA4uFs9xj1LkzWMPTLPNdssrFnjlP4sRh3Cx3facPaxP568E99IrOpGvbu4vNxWFkJNlisbRsQ
	KQ1FprsuunPJ7pNAPi9w9SNb8uAy5UGwCdytea1XWGLrEx4JhmzKP1vklyNbSKWa/yUeJ+vyILt
	bhM2FZhmtQNTav1sjLcPthQYVxrI/Xfx3FzGD7TP+QkRcdBro0dCeMlMz0GusDt3Y9XnxasCvgx
	gDIeaInW4=
X-Received: by 2002:a05:6a20:7290:b0:35d:be42:92de with SMTP id adf61e73a8af0-366e170cc7amr1362804637.21.1765349195237;
        Tue, 09 Dec 2025 22:46:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE65f7VgpKX1toP+VOD+uRyYC2xSY370jW2fBx9NgXa+YET7tXhNnG6VxOvmHuqpf5eJGCdvA==
X-Received: by 2002:a05:6a20:7290:b0:35d:be42:92de with SMTP id adf61e73a8af0-366e170cc7amr1362784637.21.1765349194821;
        Tue, 09 Dec 2025 22:46:34 -0800 (PST)
Received: from [10.133.33.160] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bfa0ad20207sm14737009a12.11.2025.12.09.22.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 22:46:34 -0800 (PST)
Message-ID: <5a5b4961-904c-45e6-aca6-b58a122e2134@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 14:46:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: move .max_tx_ring to struct
 ath11k_hw_hal_params
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>, ath11k@lists.infradead.org,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251210024036.3965135-1-mr.nuke.me@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251210024036.3965135-1-mr.nuke.me@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JYKJInUF741FtRZmAGFdrpM49XEaFFmg
X-Authority-Analysis: v=2.4 cv=Y7/1cxeN c=1 sm=1 tr=0 ts=6939174c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UC6oHK_YC1xWRw2yuZ8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: JYKJInUF741FtRZmAGFdrpM49XEaFFmg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA1NyBTYWx0ZWRfX7edvRfdvETvA
 kOp6Yhx3QkOV17ZUYGNWhIAAhDKVdlxjJ7Ui+MFY2HIOiaZrbqmtx/2nLb1sFMnDrmxax5cBlZq
 q+fxmz0gs+Re0Ryl7RweE3dtlK+PvARJvRVTWILCuY3mx7h7WdKT79p5rC2XOKHUswwVEnRWEc+
 sJcHMglUo91p9FkZF1latWpbIU5Ha/ZHxX9p6VMzuW0w0Nbi1DFwqWgtsYaRXeMpiBBx7vrnpUh
 YOsVZuQ0NjsIzOPkH2C2jOccECnwIT5EQP2J9h9sdlSFi8GzrurLmkQY7I4hcYcmllis1Qhregq
 loCdlAZSZmnxUyQC7qB9nxs1JKswky2nSBnI2bzeUKFjcO+Kj8lpcNc7UobisaYVWdfQhCrfLU2
 AUcLa1NHz5SczB1hjxgB25Vi2KRjcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_224637_835262_63E38E69 
X-CRM114-Status: GOOD (  13.45  )
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



On 12/10/2025 10:40 AM, Alexandru Gagniuc wrote:
> ".max_tx_ring" is an upper bounds to indexing ".tcl2wbm_rbm_map". It
> is initialized in, core.c, a different file than the array init. This
> spaghetti-like relation is fragile and not obvious. Accidentally
> setting ".max_tx_ring" too high leads to a hard to track out-of-
> bounds access and memory corruption.
> 
> Clarify this dependency by moving ".max_tx_ring" adjacent to the array
> ".tcl2wbm_rbm_map". Use ARRAY_SIZE() instead of #defines to initialize
> the length field. Remove DP_TCL_NUM_RING_MAX_QCA6390, as it is no
> longer required.
> 
> The intent is to make the code easier to understand rather than fix
> an existing bug.
> 

Even the code chane works, I am not sure whether we should do this. Because, logically
max_tx_ring represents hardware capability which is static. However the change actually
implies max_tx_ring varies on tcl2wbm_rbm_map definition.

If we are going to add something to avoid the potential out-of-bound access or to improve
code readability, how about something like

	ASSERT(hw_params.max_tx_ring <= ARRAR_SIZE(tcl2wbm_rbm_map))


