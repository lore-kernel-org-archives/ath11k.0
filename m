Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE03ED25030
	for <ath11k@archiver.kernel.org>; Mon, 12 Jan 2026 02:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpZHmAZwx23mQwU3yrd93bhptxxau31kfd3yNO9dnis=; b=MhMrXK2vJb6FoeTWtU1aM0w9NL
	XNH+caXuYYseT5kEkXHc858JXFkgpdoLgg6/urshrJ4G2UfHXEUXGbRzAn/S2yLDtiANYVa9k0+KY
	Fc8On9Hjtnpi6yDTyQBleNmWocxIJd/IIhkI0vxmJfg2Owwi1jiKR9OohkioTyxI2F4x9D1N7Iggf
	iorp0eDywwC3lTXQiU6k1pbin/qRKT5Z36dC9TePFB1FM98svY/rdDq3xmzEVYs8mJ87xzwBpIDDa
	/5ivM2Nthlduxk2oWuLOX5gVpXH92tEFYgbWg7vgWV6M/bBDZm10TXRMkVhRnGgTN5v41IcBM12Xn
	pv01BVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf7od-00000004gLH-3HmC;
	Mon, 12 Jan 2026 02:37:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf7ob-00000004gKk-0rLQ
	for ath11k@lists.infradead.org;
	Mon, 12 Jan 2026 02:37:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNC8Ou3631311
	for <ath11k@lists.infradead.org>; Mon, 12 Jan 2026 02:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RpZHmAZwx23mQwU3yrd93bhptxxau31kfd3yNO9dnis=; b=f9qjzfWAnm21A2Rg
	iChFU1n9Yd42IZ3yG2NFa3oTauctVDGvzOZDpGC6fEZG+3CVMgJr9IfAxbqThZ2C
	n7ZS9nuhDg+VWFbzOsAK+Ud1VODy17L/Un3JvwzvrDsoTnCBMWWC4P/g3WuJzMfO
	YYOm6uJhCEjrNC0ZqirEZHfIAJPKVuqjeV2/+eVgKLKHYxerr/VcNdrxbse4FcLU
	ewAPuwh+/lAu0mogtybyJ4lOSE/cxSotLa5KtDG8IqSIAPoA25yAD1bWzHw/jyIO
	IFgp5oE9+NHf/Cxahar631Ax/Nq6PFiDE/l68Gzi9NFkg7QONddwxHM3NJIprJxo
	q/nEDw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxtvud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 12 Jan 2026 02:37:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso4013473b3a.1
        for <ath11k@lists.infradead.org>; Sun, 11 Jan 2026 18:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768185476; x=1768790276; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RpZHmAZwx23mQwU3yrd93bhptxxau31kfd3yNO9dnis=;
        b=UX6ng6dJvEeKrTg2mn+/9RiU01c/9nN6FIIVaUJ4xkZcUkvbh07l5MeRc84yi8CRcH
         afqW2afB8dN4oeyuCBIZ2ufSeQzsOhDIOp8MJoHUtKJKRFNKuDlhLSIq3OL2ipX1nUPw
         /q6GRrq+JLktZIL6zH3Rh2GGWc8VkEaxnsuvHwLI2KYBmuW0lEY/IeegZxON4yUuteQk
         rOz5yZZ+Rr+Q9sTIMOP0TVFFj7XEL7vI+Ssfzcu0Se//QvlfQSTTF+hj8OIWXtk2y6Wy
         ZP6XgtTS9tHv14pmhKN98fWG9NSXnV9KKVSS2y9SMrJF93UJHPBH/fngmsOWNg3btuaz
         cnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768185476; x=1768790276;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpZHmAZwx23mQwU3yrd93bhptxxau31kfd3yNO9dnis=;
        b=AOMHPVg74JQWkGA4TKK+LWGN2MrWf2XJ9mIYzAOYdoTrKbydR+cHnKZEw6T8mDD9LW
         HUDQ7q+4MSpz7diu+6UWyORaNIqae2B4Lx/5fTKoCebBufOUAQv8nKjor5uvy5YYyF7/
         VYL5yqU55WvcczBFhJVnCZ55quTkz1mkRi5GQ3/wYvMFpadms5Uejw3Eaen1j51AN1xq
         M1DRiyE2zQRcGtvga1K7uVRaNTCgNpMHI/wEGIPC6wpMGAcBGyemNSaptjXBfnagzl2O
         5UJ8v4thklt2lIaEz6ngA0s39Z4ePWG0mll7DLceP+Qxm1JdL3SOoHLyZye24oSbpFH8
         IcXQ==
X-Gm-Message-State: AOJu0YxQGNfuWpkhlAir7/4eRGV3gQJDdzOoJXihQHpL9NGpEfYFVnmd
	8o5yAj/VH19ZuGdxfmx93Ev/wr2+3w9iPNVws91u/RVh34EYgkwUSyNBhYjEhX3D4X3MVKhPGuc
	a+CALoDdDN9KRFy46NAGSogGmbxbRaJihey8yvTyMlfjLMGbzWbDG2OwIcGQ/28xr
X-Gm-Gg: AY/fxX7q5UxmP0QGSKD+VjHXe0Dfq25uviw5WvXfWy5EqYZyeOewkCRhxQeoCHi/FPO
	w404RX6sRUAof9qUYPa96g3+Ev74jowyaXvE+ndSB1I39usYDzA43nCX5d/r4fQBbl/5FFH4BDU
	S+kgwraMcfiCzTzPAvb8JQTGZGvpgoD2aUmXM0A365KBrDHA3t/EgfUI4VxR/35nRfOwP8FBlE/
	SwCaPkJLIcNU5Jdj4aQ4YvG/yuDz4wIz1ohDmM7ttjLIrCsZxbAmmyEXJ3ha/X/+/r8IQb+vQMR
	Kwx6lnXxB9JyFD7a63cPsvFiQI2zANs9+LevkDzjTQhaAbhfuc50duLHYLOMes4jdrFmSmrK+Xt
	MNb7Ijmd4D6vjn399soCq3uunZuMxv42NKXR4A91X7SCUG00UnZYS+WRbkUNL/rPNyDlTn8jhRc
	S5Bsn3Tw==
X-Received: by 2002:a05:6a00:1256:b0:81f:57db:a459 with SMTP id d2e1a72fcca58-81f57dba50dmr1419734b3a.29.1768185475924;
        Sun, 11 Jan 2026 18:37:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHesLILmPoHaQoC4X/cA+EUPFjnnrCyEGFwU/qaVTXdzYOj8jv4W+kfOrJFIV3djtSq8t/GrA==
X-Received: by 2002:a05:6a00:1256:b0:81f:57db:a459 with SMTP id d2e1a72fcca58-81f57dba50dmr1419718b3a.29.1768185475369;
        Sun, 11 Jan 2026 18:37:55 -0800 (PST)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e6c8199f4sm4245748b3a.68.2026.01.11.18.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 18:37:55 -0800 (PST)
Message-ID: <c63b4cc0-3157-432c-a83b-c638e8c8d665@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 10:37:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Add quirk entry for Thinkpad T14s Gen3 AMD
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
To: Ilya K <me@0upti.me>, tiwai@suse.de
Cc: ath11k@lists.infradead.org, jeff.johnson@oss.qualcomm.com,
        linux-wireless@vger.kernel.org, mpearson-lenovo@squebb.ca
References: <875xaypnkz.wl-tiwai@suse.de>
 <b410fa3f-0241-4805-afb0-efb950e04bd2@0upti.me>
 <09b6b13b-2b88-49b2-b865-f70996708c01@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <09b6b13b-2b88-49b2-b865-f70996708c01@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=69645e84 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QvldmTvwu3qAk1I6jywA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: dJUPKZ91KRGMpDtnHmAXqwo9qGgTOrKr
X-Proofpoint-ORIG-GUID: dJUPKZ91KRGMpDtnHmAXqwo9qGgTOrKr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyMCBTYWx0ZWRfXwI9MgyEA53R4
 HQwfRF9g7c/x4TAgcz7bALgOo31zjPX6HT2rf73x545wqwCp/1uStlYaOGW5I+PbVnuMHNTEAno
 oPtfwghuJGtbKa8l4nJBzGtrG1yA/TFMzilyrKcJ3fr0M+JHbNqrg0nbAV4pK8vZBr+fwORaEag
 o+6k7LilvLZ3a3oz/nt4KlFynZWRXxwPoWfWEo0ZQS/60Ob3kOGjgWzyHCMSkcNf3SbSfRb1yvz
 ICUN9nR1TCaNHnldUr2leQwSyEYbs8+qGQWxYvVsIgw+E4RweSbViSkmOiccfzGmf51uqZwiwu4
 GpTgUXlM61oG7jVLuhE8/aqtgCsUPFLXDrs0hmCBthGhXWn3+Oq5j55vfHB8VOyyJUBaIq5mmNh
 mSMNIjb7OtaB2OsBN4ux23QdZXfJHH1r3paxdIlHirYgh2e3p9YdK4qLH8K9ZSH6vRwtqDci8+y
 /y2D+idMP7IQhf6eLcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_183757_254372_0AE033DA 
X-CRM114-Status: GOOD (  15.03  )
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



On 1/12/2026 10:35 AM, Baochen Qiang wrote:
> 
> 
> On 1/11/2026 6:47 PM, Ilya K wrote:
>> Hey folks,
>>
>> Sorry for bumping an old-ish thread, but I've had the same issue on a T13 Gen3 machine as well (model 21CG), and there seems to be no better solution in sight.
>>
>> Also, here's another instance of what I'm pretty sure is the same issue: https://lore.kernel.org/ath11k/6268b094-5a40-40d8-8461-9c9b0f9e1ae3@oss.qualcomm.com/T/#t
>>
>> Can this get landed at least as a temporary workaround? Also, should I submit the 21CG quirk as a separate patch?
> 
> I had an off list discussion with Takashi, and based on the logs collected I don't think
> this is not a suspend/resume issue, or even this is not a STA side issue.

my bad:

s/this is not/this is/

> 
> Before we conclude whether your issue is the same or not, can you please describe your
> issue in detail? specifically is it an unexpected wakeup or is it reconnection failure
> after a normal wakeup?
> 


