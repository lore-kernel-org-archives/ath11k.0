Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A5FC0218A
	for <ath11k@archiver.kernel.org>; Thu, 30 Jan 2025 17:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APiL9Qgzccop+1y8AsLQ1XuRD1MarlgIXAZbOdLJwZU=; b=1OE2Va/gtVi59U8BWsP1GeYn/v
	WRIVybNBu+cw/uDTrPam9P7USxNAsYRm+m6pEk6KDhDpn2QkgNxFzER7lt5rmL8etdXrmfuLg2gkE
	JrMkvAPsXp86/DQmOnuK4/DT1jzrIlyRpgkt2p8xsRHd5dh0eqSZ6dpVtYPoho90qNSw4folTif+V
	196p74ILiK0q9AqriWzpn16734jReWsVBhD+phWoAgRhw8u4zZvgB7+Dvw9JUqKNFgYtjVjZ5CeL4
	u08AZavhRP+xfPCBy0mkYf6hgsaqoc4Ulaq4ozlKxUU3IueKOhVVD+mVKPOjJG+FjTr88yjU+Oyk8
	EHtWlxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYpM-00000009LgU-1Gcq;
	Thu, 30 Jan 2025 17:59:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYaw-00000009Jp7-3Tza
	for ath11k@lists.infradead.org;
	Thu, 30 Jan 2025 17:44:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U9HmUX002135
	for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 17:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APiL9Qgzccop+1y8AsLQ1XuRD1MarlgIXAZbOdLJwZU=; b=dJqOOGm1LYybRoZ/
	SKI+R5jmf9qso/MIZPhaiH6kJuD2WqAhhBQLuOifNHuLwJQxtekOqTyIDskM7J3Y
	o/tWlvppxPEPoWZ6VhaHq2k+Wy9AeYLtn8K1v/idzbLl+pOphr916OKg+GBX+IBU
	ozSm+FKILrP/yib2eoTEzj+vnhS73rOCgixY0zIow7TiNzaG/sfUTfjp9cbBrVSr
	ICRSOxxpkv84kaHFjn9u5R043gRRbXIt9EKetEPhU/CEFbRr2wBLZDmkEauH5zJS
	kkeePj1iCXPTyFRVoR5moNjPQrcjYhDNFqvcMEoiGUCvh6F3Rj5QzyCLkg1WZsZR
	DaWNSg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44g6nws7ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 17:44:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so2032193a91.0
        for <ath11k@lists.infradead.org>; Thu, 30 Jan 2025 09:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738259088; x=1738863888;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APiL9Qgzccop+1y8AsLQ1XuRD1MarlgIXAZbOdLJwZU=;
        b=dclrnaZ0N1KcIN4hB7SKGw0rI3IXMIK5cGGF+1L+8b7GBKo/dt3mGQA1SY0BcBivDc
         W1V08Qq7kzzt2ISfc4o+ijFyVl2FN3U+ffMnLA5jDSUgx3e0IQB25jEWYpIeA77j8Aj4
         dUUXO1Ao4Y9oKhnJtmts2EdV/GVnEU/uVfHxBrOvdH7qKvyuIos4HrpBLBU0NrPKPztw
         d9nVxOMom29lixlVmIdvzjkiIpTilt+m83fp4TmTF/XWp9+XDQp5FAYT7RB4dNGHerod
         5XopH0SqSYONZmkOuLTFR5brT/769szpyMuO6uYr5hObV9w14Cgm6b1VBGdQ9Gnc5GWV
         JdaA==
X-Forwarded-Encrypted: i=1; AJvYcCVy1PlkW6TqQa+V0HKEE4fbn8u04DimtGmbF5Uw81qdhOUGhsxhJfSppBDENXnWtxu0qDChHVk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFI9B2tPaJ6+8RRed5TIfT/Qg9B4MwwRIR5X+7klj5mL+88sX9
	1cvX2jYNZZCX6HRy9oecqS/RykoBa6cPB6/P7Hpa5EhTO+0qaunjr+CrxkOg9tQW8bWK3nE1VUB
	37WgNRzQNk0IU8ucaJ3c7yyvr+f2X+1b6vII4B8+0W1gc49jwcFNnaHinwJlrjjndE4uW
X-Gm-Gg: ASbGncuQw+XskbRT2E2eWC8wMkLl84lM9GIrBPRDa/l7PLD/0Ust7fPj1oFMy788e7m
	+oWGAeclkiZyeMtppP5ZtmcohXDZP2L/J1HjO/LTwMI5xhgiUhrP4slpwBpWz13TuU7K3BfmPq8
	VVuxwRloVvNK30MSzcnbie4YfTNChuu1u1I4M+dzhJofoS/dQSvxU2uNCeEgangQIagq+M0s+6W
	64yXhsYIL0Evhn7YAhJvUZx0iFNT5gDumJkU4kJ92I/oil0BnoeKt2UqdIYiEYXyTH+oKrnm64R
	v8eJ6ko8n3wohM56uILuJCXwMGLcXO01bjn/ESkjCWfbT3yH5lOgob1V3WgttwGKiMC46k5tmA=
	=
X-Received: by 2002:a17:90b:1f92:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-2f83ac66143mr10901964a91.26.1738259087992;
        Thu, 30 Jan 2025 09:44:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUek7nw9VdAlEoKRC5BUO1BhKF0f54K+odPqUDD4lyw/JbUY4g3T1Lj50RsNebkdIphLVdZA==
X-Received: by 2002:a17:90b:1f92:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-2f83ac66143mr10901929a91.26.1738259087588;
        Thu, 30 Jan 2025 09:44:47 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bccc8a5sm4210298a91.17.2025.01.30.09.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:44:47 -0800 (PST)
Message-ID: <d2b5c265-af14-43ab-b50d-e364d3214fd2@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 09:44:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: remove peer extra rssi update
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250117181953.3375273-1-nico.escande@gmail.com>
 <d5eda793-c7e9-453f-9dbc-07e5df73c47d@oss.qualcomm.com>
 <D7EG56E1I0SX.3BZRTM7N6CQ44@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <D7EG56E1I0SX.3BZRTM7N6CQ44@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uukQYrTE5mpNLpwC9Eg8vjLIutj5qhJ_
X-Proofpoint-GUID: uukQYrTE5mpNLpwC9Eg8vjLIutj5qhJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_08,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=837 impostorscore=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_094451_006982_1A5100BD 
X-CRM114-Status: GOOD (  11.44  )
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

On 1/29/2025 1:24 AM, Nicolas Escande wrote:
> Arf I can see that the commit format is wrong but I wonder why checkpatch didn't 
> arn me. Do I need more options set on the cmdline ?
> 
> 	scripts/checkpatch.pl mail/0001-wifi-ath11k-remove-extra-rssi-update-in-ath11k_dp_rx.patch
> 	total: 0 errors, 0 warnings, 0 checks, 8 lines checked
> 
> 	mail/0001-wifi-ath11k-remove-extra-rssi-update-in-ath11k_dp_rx.patch has no obvious style problems and is ready for submission.

Are you running checkpatch from within a kernel tree? Looking at the code:

			($id, $description) = git_commit_info($orig_commit,
							      $id, $orig_desc);

			if (defined($id) &&
			    ($short || $long || $space || $case || ($orig_desc ne $description) || !$has_quotes) &&
			    $last_git_commit_id_linenr != $linenr - 1) {
				ERROR("GIT_COMMIT_ID",
				      "Please use git commit description style 'commit <12+ chars of sha1> (\"<title line>\")' - ie: '${init_char}ommit $id (\"$description\")'\n" . $herectx);
			}

So it will only report the problem if it can find the commit in git so that it
can provide the correct id and description.

/jeff



