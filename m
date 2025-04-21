Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFA9C369AB
	for <ath11k@archiver.kernel.org>; Mon, 21 Apr 2025 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8fbPD2NtxyIh3l37pou8fckx/G7NKhgopUfIfvtJ9Q=; b=ABC27DjhTYlKMiI6mJ2B6qfQEb
	ZhCP9dzwtH9WZ72wxU3C8yVpVNUr0SU7NfBNkXKdxr0FHuEk5p/pn6cHqIne+jsWRxfI1tD7xfA9g
	5vyS3VdUrLmNfaAx7Yw0nlnvsb/DkWI39+CWqbcjstjI3SUeaC+PjvEOccksc95IzVJACHLY6NOc/
	eTP62VU2njr7yCYytxobVkNGyRPIN3XiJsTmbTcCJnxwj9RlSAyoxSbLmtjIDmSKPHAuIRviIFYcB
	wE/ZMEGPVb59bEint6TOyZw+DsfJvT434W5mIA6o1GsaEPqGahEfOLIvJhQUAj3p2MLIxrStHyivA
	koRNQwUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tqI-00000004egZ-1Dux;
	Mon, 21 Apr 2025 16:17:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tqF-00000004ee8-0xYI
	for ath11k@lists.infradead.org;
	Mon, 21 Apr 2025 16:17:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LABmGS012726
	for <ath11k@lists.infradead.org>; Mon, 21 Apr 2025 16:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8fbPD2NtxyIh3l37pou8fckx/G7NKhgopUfIfvtJ9Q=; b=ZKzSFaGC9+7cWVZw
	pCdeogtZYhAXa+6TkCWjMCcrLNv62cMslnbSK8Oj3A60xf8zik9BlDCT+QL7pM+0
	sQLJfYssBaBBB7I7HmmsTRvjt88zdrSzm8+MrjGVFi/+ADzlWR/BoNaKbUtYJO1P
	pieQVO8Sh3M1LM6WfuLoRyVgyLS1wl0Z6D8Xy5kpDMYtSGVmKB68nTD0azKc/pEh
	bSfOES/L9RsYW4H4MdLHsN+YkLhKH3axv0LVxaaXYzyz6WiqjioKvnCjMMyjG3V2
	gs2BNZ8gmsxsfwLtTQmrE6uxp6SK84TxG0hhhksbj5oEKB0/Nw3Ni9U40KtcxGs1
	F73aTw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416qvwc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 21 Apr 2025 16:17:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30566e34290so4413115a91.3
        for <ath11k@lists.infradead.org>; Mon, 21 Apr 2025 09:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745252272; x=1745857072;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8fbPD2NtxyIh3l37pou8fckx/G7NKhgopUfIfvtJ9Q=;
        b=S8QwyKScCW3L+AQO8egXUTIThK+gGUgRUbdmZe79VVv86LuxuDQYBUFjMR7LhQuVxr
         XF0YE+3jBArQ2WqZpUl+MHFllbfoj9QvFRKKUYIR99+Z/Bj+yObpvJ8Sqh0E/siN89fP
         p9ex85Pbg6krWFOmtGYlIlsRJFHgl9mVBzNhcdAHBkAJgCJHUU0yWmYGBDirpAUjwESp
         xSUOuhkdQni6aIwcDxWEMiFbogYAfI8eGsiZWZYGOsWDIW54i6ddX/4sQWQ3qc2/ib3l
         VS72/Rzgp+BqiYzuEnUbNY3637j4i3YuQ4KcRRw/PiOs5ZdfOIx7J6G7n+qk8H5x7UCP
         YRyw==
X-Forwarded-Encrypted: i=1; AJvYcCX2YK5LkoS2IwQwbzjWS1BPbF2PgKp41gnKG3PdkW0/LtCDTeGca1KO+DhB/+qJihYjjt9bt4Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQe+6dslDuhvmWcmJvCopdSa/muma5xnsQLnYpisU/PH3JHdbG
	hfONnFFSZ1dMqwqJDXUNOjFgvGKOFE6Dwc1AekMtTZ8JcnCMuh5b9lnBgyalTWGl8EcnCKkJwCM
	EcbN0YZYCk4YACfO+uLguCWoak7YQYyh0CyxBlmietywkwmxM9Xz2T/QR9xVj
X-Gm-Gg: ASbGncvMP7qxJx69BBK9SWXG1s6FJa+I43ZN5QWMzWIOH+jvzTDYUImmHdBC8YUwRmr
	bAt5gOypVBhbgI6tvAb4Xp8EuII0HiRW2MeHIoAq359QoKxkbdpy/dFXMioViS66b9+NEx08HsA
	Jcce/Ex5g8/1AoKekt4addchrcWeNwXG7Ql41wRqjAhzOLyhHP2+bQbhe1gXtJbKnOveT15AJCf
	IbU4PWYF3VWYfhpCgA+OOJZumJ1Sta8+MAz1MbGxdNjyzYjMbY1So+EryzuvWLx6osMsYGiXwLf
	/dtp8PIXBW4b0jrNSldBbR3Jy9YX/W2NwXQmQyGKA9Wc5loTPojqZ4pRBhe6D9FJkFM=
X-Received: by 2002:a17:90b:51c2:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-3087bb56444mr18431237a91.11.1745252271843;
        Mon, 21 Apr 2025 09:17:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7tD/NOmm7V6TL/yBnEhtvSCWTaIJQOX61r+dAwkEu2rf7ZlcsGmggnhC3PaKfz3fsM+1V4Q==
X-Received: by 2002:a17:90b:51c2:b0:2ff:784b:ffe with SMTP id 98e67ed59e1d1-3087bb56444mr18431197a91.11.1745252271476;
        Mon, 21 Apr 2025 09:17:51 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df4ed27sm6803693a91.38.2025.04.21.09.17.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 09:17:51 -0700 (PDT)
Message-ID: <a7b5e80c-2ed4-4557-9304-8e5e0a6ee513@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 09:17:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next] wifi: ieee80211: define beacon protection
 bit field
To: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>,
        johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20250421111505.3633992-1-karthikeyan.kathirvel@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250421111505.3633992-1-karthikeyan.kathirvel@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=68066fb1 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=gC-mUCSe0qw8eRQpxs0A:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: HfHyrw2187yfIhclhh-9SuxyQr3X4v4B
X-Proofpoint-ORIG-GUID: HfHyrw2187yfIhclhh-9SuxyQr3X4v4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_08,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=966 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_091755_420166_52598092 
X-CRM114-Status: GOOD (  16.19  )
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

On 4/21/2025 4:15 AM, Karthikeyan Kathirvel wrote:
> An AP supporting Beacon Protection should set bit 84 in
> the extended capabilities IE (9.4.2.25 in the 802.11be D7 spec).
> So the *4th* bit of the 10th byte should be checked to figure out
> whether beacon protection is enabled or disabled.
> 
> Signed-off-by: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
> ---
>  include/linux/ieee80211.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
> index 508d466de1cc..aef5a616d598 100644
> --- a/include/linux/ieee80211.h
> +++ b/include/linux/ieee80211.h
> @@ -4087,6 +4087,9 @@ enum ieee80211_tdls_actioncode {
>  /* Defines support for enhanced multi-bssid advertisement*/
>  #define WLAN_EXT_CAPA11_EMA_SUPPORT	BIT(3)
>  
> +/* Enable Beacon Protection */
> +#define WLAN_EXT_CAPA11_BCN_PROTECT BIT(4)
> +
>  /* TDLS specific payload type in the LLC/SNAP header */
>  #define WLAN_TDLS_SNAP_RFTYPE	0x2
>  
> 
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8

FYI there is a pending ath12k change that needs this definition
https://msgid.link/20250421114711.3660911-1-karthikeyan.kathirvel@oss.qualcomm.com

Reviewed-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


