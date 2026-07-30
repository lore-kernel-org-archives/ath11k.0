Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E074C54FCD
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 01:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDnspEIVuTCXuRcKdi6kqP3UXQ4ZvcdlyKrCIK6R5R4=; b=byI8wAGXcURvAIMwGhzRZb2NoJ
	SvVZIJHAJxz379EOJbdBBWYZNLEOgD8arTpLomX1oS/8R9HESl7oxD2Szji5d3t/Qpfu3dcYDMmdM
	hH9Vwln+jLD9bTQgu7zRJpwXbm6t0tfJzrd2IGhcbnJxzjuL03o3pXXpjRnmhvIhyJIlWgtXgECCz
	cdY7Y6fgqjtydqX5UqyyIxSEHuBQ3qBWw6WQFBQGgEX23sjUL562A0wYiHIFVliIGyVpHiXIqWL8T
	1rhqXhgVOCjh7fVGaHxxedCx5tw279u1tCWQMTLTCIL9FoTW/H6tv+GWxcXY4N2boIfFYP893PGfB
	k8Urvmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFVj-00000009FNk-1DwY;
	Thu, 30 Jul 2026 01:24:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFVg-00000009FNO-3WUk
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 01:24:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U1Ergm3947850
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 01:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HDnspEIVuTCXuRcKdi6kqP3UXQ4ZvcdlyKrCIK6R5R4=; b=CksDfOVwJKYmiLi7
	WXQMOfxd4DerIX60bdOoUREBACXhaSMVNLCPPhBTk/cdi+IcBDvQ7Fgh/Zya9ajK
	DlR1W+GhS8d1R8gpM1Kvmqf4FU2NV8AHUVFmr8z3/4e6dEpWA/MPhwDRTz2W24G0
	a1Mp530NJgryw+UET0gFI4fulfBmBprGhYf6C/8Zh/sD1O/CEwtQFmxTOcyhpiu7
	5ezksN/72IGIlgrfsdPyzHz/wOINZUVNcd1W4zG0nhWSoZhhORDHoWosKDSaTANp
	B58SsFmtIOtUQE4/VPqQF+9F9Imcs0weCVUwJ8G3R4Yj2Z8zFYYsyuxm1/5eXqB/
	K7pElw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqvsb80yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 01:24:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso2045032a12.1
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 18:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785374670; x=1785979470; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDnspEIVuTCXuRcKdi6kqP3UXQ4ZvcdlyKrCIK6R5R4=;
        b=Yg4WjnSHgD1B2UFXvY9cHF/C7dr4YEtXwg5NnEE2yYos4HeAt0Y++PjV+ye+N2eFLH
         oQetbTx+N/Sor3xvTj5mNdru4rI+volLPytSaPugZgAMEt5BLYXwpKJPdhFYZaz/viJi
         7EftFGmTHuuExsdx4W7sBoSHfeB45TV/AWkXRc3bUD2b7KEovohKuxMLAj4uYthb2VEr
         /HHwr+gMkKMO4DvY+7rO6XPJk1IOtl5acJTHE+T0Xv6SO10Zj/KNXgDYKeDil/zIq/CS
         pEi8eRTHMntPowJF5g4+i0o/H3Nb+Xj7BTtI2lP+hxcExFOjw3B2O5sFfN0NGkDbk0xT
         ewPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785374670; x=1785979470;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDnspEIVuTCXuRcKdi6kqP3UXQ4ZvcdlyKrCIK6R5R4=;
        b=GOpPlNKxsJQ3RGnqHkatHqydyGQXLLa+rvNV1yRQ+CAf+halEy4GJpPSVfTyNbXsvu
         MM4DezdpAkbjkIeIvfntONQzUvYQ9V/HCYfrxjrxw0lgoRtuar9CpaytQJJ+O1HBml+I
         z9qzYsqBuXkIO0IaVjal63gGppkVoxe80q7IKPJpIknPxCF68ETA6rsu/ffMKItx0WMY
         8rCPX4HrnFi9Z26Gfe+wL01Bm1nZx9cWwMtjQo2lZ+X0JKpH0cfST8qPUxUv+vcKyODG
         vevpGnLBB+39kCOPd6636gg3EFE/G8VfmdPhUwM9C1F+zFLZgome5JU+xJS0qywMCg/i
         s+ng==
X-Forwarded-Encrypted: i=1; AHgh+RofRWhKl3wiYg392yEet92FZxTK9jDdPyJmy1fW+RZ+bsxF56iIRsMdhfW0f2KDVTSx7HTSWSM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdwpmN01LGxdS0c1521C261f2TRXzQMzXETSQ73KlIvQKSG4GM
	ocAixj8G5QBZEna450iQYotU2uiMgsoLK7ZVL1GwAKJ2B9a5N+OWSqejDPFIb4SIIC60t3NPyXt
	+EdQ/D+pa3G+co0AyZfyZzaaR8n8AsB7wfNNNw4wYx8vJLU7w3JDo1Soj9rNn1A7Y
X-Gm-Gg: AR+sD135Q5x/bcrxewrhy6aSID4S3jbmKe8pXSIX/Xe1jopKQkHrq0tc0UNDAVgLzJO
	lfoNqgP/U5k6/NVp08vEsvC6oK2XlLH5fLzcu4RAauIXwWNAMazGI9JkfH5UclvvlxaAThvtG6A
	EwbjJ3nHxq3NzGh2PY07SeSIGIvMGgIVaZ4ofqkoXqlfq1npUzWBQtQvuAgy3xMblYG9IOL+9An
	9MFoPkASjITYwp1EQgJSobbe2B7XFv0RDR2P0CIkHNgF64yMfUmMdmls6YxKxVvc8VViunm6fqk
	qFJMM2jWcO/e50qZC6v3rW4z518QMzMd7/ySbbfIT2V3PPRgfWrvX1U/LVOAsuAlqydMBbymvSX
	JpImhSVuIjpSSjGte14QoUa8ZROlCoMi1RuQZE0qySuSn+IkSZfFm5f3W6w==
X-Received: by 2002:a05:6a20:1d98:b0:3c3:8d4c:668a with SMTP id adf61e73a8af0-3c90094c2b0mr423524637.75.1785374670002;
        Wed, 29 Jul 2026 18:24:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:1d98:b0:3c3:8d4c:668a with SMTP id adf61e73a8af0-3c90094c2b0mr423501637.75.1785374669556;
        Wed, 29 Jul 2026 18:24:29 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265010esm14721244c88.6.2026.07.29.18.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 18:24:28 -0700 (PDT)
Message-ID: <5ba0a5c3-7009-4e9f-b5b0-11ec79469451@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 18:24:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260729020005.219253-1-zhaojinming@uniontech.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260729020005.219253-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAwNiBTYWx0ZWRfX6nPij+DVqp0i
 zeo4dVw4VxQjdhTUH0StQhNQ+zccAHuhDdUCzlK645LTY6eSDaO7oYhzj9c/eugGlA3wA5dd2sL
 1mS10ICGRJye+lBfy/f+E1CMsLo41ywOE7rtc6/Au3V51OhMgzyr+HE/zJcZmZrnOaYGAYCJ9TP
 72A4UI2JFkESZLYPI72TkdxhljMAgYE7mSNaF37q2SN+3osuB5vUmJMle0JBNQPvOTCUahyoZyn
 /EypVVWAy7pf5RjKkVUCPf3rCaTnNG8EiyesmjGpuSTlvTV7lnEL9LFCmq1nDak4tu1BtAyuZHd
 tIObiliucPygQ9AaMgKr8RA289o0mjJRQvOOPVF0b81O0+Mp/KbhtGC4uBaiHUINBOrMI8BNQuH
 6P8bECrAJJJTwUp44yqCwA7OQVL8Sbmb6uPRyEmlCwDzPTEkuRe/71DWfDAR0YNBiijqDv66tur
 DApxDix2nRjPXajOmqA==
X-Proofpoint-ORIG-GUID: zMpAKSAQoosCqLv_upfkRB74gYcU8Tb8
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a6aa7ce cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3x75WggdeHjsNz2JpxQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: zMpAKSAQoosCqLv_upfkRB74gYcU8Tb8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAwNiBTYWx0ZWRfX4aeDHLy8UfIp
 7Ng7vOoABiWMW1FO+KeRGC2H2PKb2I3o8PxiyShY0NElkfsEky743uAocGKc3A1kEo31U4eEg6Z
 BhMa/HGEzmRdxG2MXHApW/Mzuf6Q3WY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_182432_919774_F252CBBD 
X-CRM114-Status: GOOD (  21.28  )
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

On 7/28/2026 7:00 PM, ZhaoJinming wrote:
> In ath11k_ahb_config_irq(), when a CE request_irq() fails, the function
> returns the error immediately without freeing the CE IRQs that were
> successfully registered in previous loop iterations. The probe error
> path does not call ath11k_ahb_free_irq() either, so the previously
> registered CE IRQ handlers remain attached to the interrupt lines and
> are never released.
> 
> In ath11k_ahb_config_ext_irq(), when an external request_irq() fails,
> the error is only logged and the loop continues. The function then
> returns 0 indicating success, leaving the device in a partially
> configured state where some external IRQs are not registered. This
> causes enable_irq()/disable_irq()/free_irq() to be called on
> unregistered IRQs during runtime and remove/shutdown, triggering
> WARN_ON(!desc->action), and missing interrupt handlers lead to data
> loss.
> 
> Additionally, if alloc_netdev_dummy() fails for a later IRQ group, the
> function returns -ENOMEM without freeing the ext IRQs and napi_ndev
> that were successfully set up for earlier groups.
> 
> Fix all three issues: propagate the error up to the caller and unwind
> all successfully registered IRQs and allocated resources on failure.
> Also move ab->irq_num[irq_idx] assignment after request_irq() succeeds
> in the ext IRQ path to match the CE IRQ path and avoid storing a stale
> IRQ number on failure.
> 

Is there a reason you didn't carry forward Baochen's Reviewed-by: tag?

He first gave the the tag for v4

In v5 the code was unchanged, and Baochen commented:
I have given my Reviewed-by: tag in the v4 review. Since v5 is identical to v4
you should pick it.

once again:
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

v6 was a trivial change in code. If you had applied his Reviewed-by then I
would have maintained it for v6. if it had been a bigger diff then it might be
ok to drop the Reviewed-by, but you'd then want to mention that in the commit
history

v7 was unchanged from v6 so it should have had Baochen's RB.
code in v8 was unchanged from v7 so it should have had Baochen's RB.

This is another good reason to use b4 for patch maintenance.
"b4 trailers -u" will accumulate any tags and update your patch.

That is all advice for next time.

You don't need to post another version to pick up the RB tag.
Running b4 in maintainer mode will pick up the one I just added above.

Baochen, no need to re-review.
Ramesh, would like you to review.

/jeff



