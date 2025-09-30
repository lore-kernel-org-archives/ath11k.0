Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0372CAC5B9
	for <ath11k@archiver.kernel.org>; Tue, 30 Sep 2025 02:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hz1f+ctCOdSlQLCHYJ0Hn1Xi6hiM56h1h0iU9p+8gY=; b=c+Mc8s7lpuiNC8MvaBHSLpN5TF
	ZD7cXPBlinlk4yFATmBP1z+9JKg9hDpQ97VEQbmf4Cns9y2cJzXSTOPtot+Czt2awh8sQhLK1oTnF
	JVA4fc1ZlID2RNOSPkeS/jxesYQFM3cBNnmrQxxhxuRn6VZ+FQmxmCdoAnWeAQyoq0oppGqWQkR26
	WcK9RdJiyUipvhVkGlRmE/uGO7I1LP1+It3IXdyoqs4TT5o9579Yq26bdrLdJnTMDc2CxdRf5Flc+
	M7qm8+UZGBgytgN6p6+LiFOx2P+CVSZWziGLaNVBcN3tuv42AxM6GfAf+AHWx1sw5yF8IpUFbgSjf
	OU5J5wew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Pw8-00000003sIX-06UL;
	Tue, 30 Sep 2025 02:17:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Pw5-00000003sHp-1JQE
	for ath11k@lists.infradead.org;
	Tue, 30 Sep 2025 02:17:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TKDcoA022787
	for <ath11k@lists.infradead.org>; Tue, 30 Sep 2025 02:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hz1f+ctCOdSlQLCHYJ0Hn1Xi6hiM56h1h0iU9p+8gY=; b=h755Hk+sWaYbZulx
	Do1YHY2zJlsOcKa6/C3oEkdXCsowlx4dfvWbzd0dRQ2jxdajHDsPR2ERZag9a8Ga
	eBNCieH8VvSuWfM0beEhgArNZKJKkZduY1kjAliBMauDIRYuUDOGShYbvZzSug/J
	ZPIuA+sTivEyoMVNASBK1SHnWKd0RwAFFtLa/RrownSXJBMWidcbuGM9eFT/DQYX
	6hiE8jx1Ue8+iE7SyLHBC3rrnSESNKXfspL+lzp9vfjnm2zAkHM+LPNDFeLbOY1W
	D4iC0nW8vkom1nMzBoAM+RQL+WFjHeuAO5vCKyGgX9nt5RZZX56GRbE/5SShyfXT
	8D8iXQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdf3yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 30 Sep 2025 02:17:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33274f8ff7cso8593739a91.0
        for <ath11k@lists.infradead.org>; Mon, 29 Sep 2025 19:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759198668; x=1759803468;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hz1f+ctCOdSlQLCHYJ0Hn1Xi6hiM56h1h0iU9p+8gY=;
        b=VjMGgVJWhHcAaCFGurPHlay2kihXXfWqTKC2uY7baX+FShaYEhzutj9TFUh3eelgfK
         Mkh76ic0AeEQI7QokEQwF/nvO0b9Hem58T0FWCk6aYLCcNXf2zdGUUFrMNiMAl5ix33d
         HlE4uwqY4iyLRIPH0/x1hVN+pwBOy4uq1guQ4nhNO2cVGOWLHgc1H/GPISCFNU26rsGN
         QLmLt5ajCxzYEMAAIt45gMatOEHxT7BLpByAVmz/SlTzFzKdu/AgMrzPARnKgmfIZU1X
         Nxed2xj86igpwtg3OaamtbvODauDaEWFccLQ1Ui7y0vr6Lr1htUxiKSbHF0St5W3fqvJ
         JwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQfpina52xZnvcMqSpBdsOWANfdxJAqgg16t27fc3sO4xUhMDPaSYuZJXFVIl+PxjEdgu7wb4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYC2E+F3OgD6u+o/YXMLMy8tHywQl733fhbs/nJhL5GuULonYx
	jOGo7OCJ6keGAaUwkGcW+e7sJ2aNEDzvPMPv7VgpUZjJ2e6hwu2cMyiF+TzUovOjIoCLJD5GwPk
	HC8iGtgvR6RUcL9ZJXZ4rl25VWZL56OEVSRfSI05JAlojiJxUDjI6Xh5FDtC45kC9
X-Gm-Gg: ASbGncv1inLZWJz7m+2w4GdaesWEhVbZ7LhXxwYOYqqL0IsGQbrkaa8yWuHmKs1Sj3g
	byUrUhpc5SZIw+bfpBE8Tkfq/1HCdhoWtt0jZg1g3wPUddIfKRBgkIg4DHoJG50kkbLPb2QVP1y
	sYTZdJq3di+d+nuhLloKROIlCvbsDqTzLYL8pz33xJnxWxTtdRUZ5dxe7/EouPHoxbPSiSMceBM
	dWzTookTCBgJ4NAq1lA42hnk3KMnHlAEALCuDeWcAlYLRtUInjdRw+YN6GuEJgXe3V3ypCIr387
	Oyn5iCmGEtJOY0EiWcL5rAagjWoxdk1zuSGP0BzfpcZAb9jx/e5PRY/b/TACy9mzHjhEiSqFd9t
	rFuMfYtlOzW73aw87dWDAHTgsGxk+iVvf1EG8zQ==
X-Received: by 2002:a17:90b:17cf:b0:338:26e3:ffb6 with SMTP id 98e67ed59e1d1-33826e40c1bmr6342137a91.26.1759198667784;
        Mon, 29 Sep 2025 19:17:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERVbkhp90h5tu5qmYaSGCuwLFew5siZS6pQayKuLPLoYMEzOkFjAetMuuaX50AkGwV+Nzzag==
X-Received: by 2002:a17:90b:17cf:b0:338:26e3:ffb6 with SMTP id 98e67ed59e1d1-33826e40c1bmr6342113a91.26.1759198667227;
        Mon, 29 Sep 2025 19:17:47 -0700 (PDT)
Received: from [10.133.33.193] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33838707fb4sm2727780a91.8.2025.09.29.19.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 19:17:46 -0700 (PDT)
Message-ID: <83de6105-ef4c-48dc-8960-430893ae253e@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 10:17:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Add missing platform IDs for quirk table
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: jjohnson@kernel.org, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20250929192146.1789648-1-mpearson-lenovo@squebb.ca>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250929192146.1789648-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YoJx5hUpWMaEINgxxAjWWpZE-YpErRrs
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68db3dcc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=XVxARQIAAAAA:8
 a=EUspDBNiAAAA:8 a=ZOm3kqi2FSFO-1B7WpkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=p77dMD-AzHemhwI1qD6W:22
X-Proofpoint-ORIG-GUID: YoJx5hUpWMaEINgxxAjWWpZE-YpErRrs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfXzamEr8yPYy+j
 8YX4eKr9U1++s6ycqLXVqgPoKKoXUJTTGlUkATZ245LNrnigT5CrTnSvVAv4UCFM78I6Ds6hpEo
 N9lOfLb+FJk8rmihA2uYNE2wxFF5f9IAgzvruxUNiynnuCcNn5YmvcdKaf5rxvNEBCP+bhJkozq
 cZvCy/Od2Pg5mfyrDiQN123TC0XH2kFLE3/Vp9C4JhHjzM/gDF+kNw/inlec7U1nyRzxY9aZ4Hh
 8IxxSwAlCpUHdmjDgB9pYoHbfILT4oczraFh8ajGLKp/qaoR+r9Q5MWDqOZy2SFeYY069aM5ZHq
 HnerGWhPshkXHlYM9xBDLmN0nCAKOUTqDt/XfGSn06+2qIw2G2sOQQ9sLD0EUZhnHwLEaoKiq6d
 DBdNBolmkLnqYLLqBH43DHnpFm0jzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_191749_360789_73527A67 
X-CRM114-Status: GOOD (  19.02  )
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



On 9/30/2025 3:21 AM, Mark Pearson wrote:
> Lenovo platforms can come with one of two different IDs.
> The pm_quirk table was missing the second ID for each platform.
> 
> Add missing ID and some extra platform identification comments.
> Reported on https://bugzilla.kernel.org/show_bug.cgi?id=219196
> 
> Tested-on: P14s G4 AMD.

Leave a blank line as 'Tested-on:' is not an official tag

> Fixes: ce8669a27016 ("wifi: ath11k: determine PM policy based on machine model")

Better to move the bugzilla link here and reword as below?

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219196

> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v2:
>  - Correct typo for T14s G4 AMD to use correct ID. Sorry!
>  - Added in Fixes and Tested-on tags correctly.
> 
>  drivers/net/wireless/ath/ath11k/core.c | 54 +++++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index d49353b6b2e7..47522fa186a1 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -912,42 +912,84 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  static const struct dmi_system_id ath11k_pm_quirk_table[] = {
>  	{
>  		.driver_data = (void *)ATH11K_PM_WOW,
> -		.matches = {
> +		.matches = { /* X13 G4 AMD #1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21J3"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* X13 G4 AMD #2 */
>  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21J4"),
>  		},
>  	},
>  	{
>  		.driver_data = (void *)ATH11K_PM_WOW,
> -		.matches = {
> +		.matches = { /* T14 G4 AMD #1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21K3"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* T14 G4 AMD #2 */
>  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21K4"),
>  		},
>  	},
>  	{
>  		.driver_data = (void *)ATH11K_PM_WOW,
> -		.matches = {
> +		.matches = { /* P14s G4 AMD #1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21K5"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* P14s G4 AMD #2 */
>  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21K6"),
>  		},
>  	},
>  	{
>  		.driver_data = (void *)ATH11K_PM_WOW,
> -		.matches = {
> +		.matches = { /* T16 G2 AMD #1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21K7"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /* T16 G2 AMD #2 */
>  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21K8"),
>  		},
>  	},
>  	{
>  		.driver_data = (void *)ATH11K_PM_WOW,
> -		.matches = {
> +		.matches = { /*P16s G2 AMD #1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21K9"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /*P16s G2 AMD #2 */
>  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21KA"),
>  		},
>  	},
>  	{
>  		.driver_data = (void *)ATH11K_PM_WOW,
> -		.matches = {
> +		.matches = { /*T14s G4 AMD #1 */
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "21F8"),
> +		},
> +	},
> +	{
> +		.driver_data = (void *)ATH11K_PM_WOW,
> +		.matches = { /*T14s G4 AMD #2 */
>  			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
>  			DMI_MATCH(DMI_PRODUCT_NAME, "21F9"),
>  		},

assuming Jeff can resolve above nits ...

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

