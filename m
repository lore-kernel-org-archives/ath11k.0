Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BDFD339B2
	for <ath11k@archiver.kernel.org>; Fri,  5 Dec 2025 18:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsAN77b5jlhTs52JfrYgOkM2xokQh050KDwqvxtezf4=; b=Sr58oKzNRWEVKX1q1Exjs/eb4j
	ENvSC6SRBiRTHMcPlQKr1ixb40zsGdndd0AdslAV9PJvUX4vACsKrVTVTU5FHAzeMMdpLqJXh7MIi
	HafRF117YxVHld4INYPIAvq36QngIktY44W2sAiPfXGlzs9uSWTUowacLPHukt9AaY3vyalLqB5H8
	/k0ZOKuQxamaud9bUDYBrkxMGxVxiMPQzbZQuvD0yvnuS3x6LDBfeBeTtHyH8xyuGAm1qhCFnYMZt
	N8k0lXJF+KGGy2e3sMT2eUHapR2pkIRrvP2ADOW8vzoqWZV5I/IE5kZns54zQtlY/WrLF6HdLu32m
	DizT3T9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRabs-00000009oYx-3aTu;
	Fri, 05 Dec 2025 18:32:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRabp-00000009oXw-2aq5
	for ath11k@lists.infradead.org;
	Fri, 05 Dec 2025 18:32:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5HrBP6866116
	for <ath11k@lists.infradead.org>; Fri, 5 Dec 2025 18:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EsAN77b5jlhTs52JfrYgOkM2
	xokQh050KDwqvxtezf4=; b=OxLv868mO/YqXAp+QmHwTnhQaTowfZihrImLFYR+
	b8Z8x/ewGBmOZGkUHHGSsA2CcvndMtvDHXTHB1letNOVkH4RvdlzyUmjol9qAsQ3
	CmFj4x+MsfyIOsCseUQSWIbyDRfdGE1HsGV+9xXUvQNwW0blpwcZ52E1AGe5c189
	M7yZBwT3h75IUmXS8sYqV4yz+hrCrbkvQ91767ePR2faSojIhg8WozMbc+/LN/Nz
	5iwmK/MLj8rS4Sad74bcoNSAbc0qxueQnnsF2c64IZnCauNPBLuwLcRVr1b1GtQ3
	Mwa3qfajp6tIWTJMN4UONvzP+tBhlu127Cy6KOBCuAV+Yw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av46f83y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 05 Dec 2025 18:32:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b30b6abb7bso493155585a.1
        for <ath11k@lists.infradead.org>; Fri, 05 Dec 2025 10:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764959567; x=1765564367; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EsAN77b5jlhTs52JfrYgOkM2xokQh050KDwqvxtezf4=;
        b=ah4IkyTnO73s34PPs21+xOGqPF8hGB7hzwixCehoa7ivQIy4xPHUMcLVkAcakH+CL+
         VHNXtlOfH+nf+FvLPH7OVm7bYeLrosoW+PIISw650jRUMRPCBNFa2gdZv04QYyiFh/8Y
         4Zuz991YGQ2lMGpas8BT0EbHW8oCQHkwny8dAgCPwT91zfQOlBbIHRiz52jlFkRhgC6B
         Q0WQE6GCRiejuwG2sgWB/XNQdn/aepffhmb9V9tvr8JWaitwxVwBtTEq5F2UIdCswXXP
         blOlDG2m/0Ced/BcTFqntbPeZhx7Ryky2/GSW92EvyKWbDWpR+m8zEiF+t2JHRa8xzTb
         LptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959567; x=1765564367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsAN77b5jlhTs52JfrYgOkM2xokQh050KDwqvxtezf4=;
        b=mhwmpJi8T06aG0jNUKUgRnlnaiIira8ISDlbTubORIWibhmwkf2Vhf+LUmZeHfxsvC
         egDT81cpRttuFXdXCwhOMg9iHm4zeja5OqF0OSdgebuasjtlH8K30l+lBKrrMrp83xTv
         fKKycZbdrDJtOQ/uZ4nxeT3Re9ww8zZhPbw52D5zNO42/hnfgqBdrclBKAl/teeK0fWg
         G7AO2mUCs3wgvU/wpFYakj1mD7dY6mCxPQPBYW9TqobdJDqMRjLl2yE+0llqGwR6rHIy
         StEiyfwh/gWEKAmAislg94yd+y+zWDt0nEh4k/JLsEsh9rwj7rirEABXIi/4si00Kl9b
         iK5g==
X-Forwarded-Encrypted: i=1; AJvYcCXSOZ0DEagkukVvRNMInpJLryxVOrrjM90873nGZrrgQxqgpnB8Rul/pNtD+2TpaU7B0adT6FU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBLRI7SPzOcyJFsGVSEzQtQRcAwZL1JXHLpOpRfFUaOapUOevX
	4hKb9mTJsQ74yR1u69o8ske81187rA2VSJiSWzFfbF1bt3Slw8fHlIcBuwvXoamIm8Vaj5CfeKq
	CuTQJLoL3bu4siJ4GvOxZDBdu94VeFqPaU98ylfktrgTBUJ3y0Zj8XqHXFXAFaTpUyIW6jfHT
X-Gm-Gg: ASbGncvHqIJDbLzRzY8vdSHYXvDxsKJOLdWVezaAYlg8aDCr+NI30ikJmeovKaS3w5a
	fhU26EoKF6gAC5tcedcXvePavkE7eaRf9KMtC8yQGOoXgxvDzOCKgeZgUMLeq18N+9cs3qj0+qQ
	7HwN1EAbhy2ZyZ66oG8c+TdnQ0JuxTOVRN5giMQ/PSbKbAqk+3JOIwlcJvcDtdl/ZRPHVB5v/PG
	EW+S3vG9Wi/s3zsQQqWO21LeuhAnFajuB3zjv+6E5yAhNXb6otdZcP3+Alewg1dwMVYPuVx+UdB
	1Gd7tuD1HId7bsalyefdznKKX5bevQx8lOhHlPyg0FuCI8h0R0soyHKRChqQiOcUmREdc+cbVTc
	SVQ70T/vAc78ZKnVDAeuB29VBY9fDRYYu3B6lnuPv6Q+JQd+YNwgelyH8TlWjtXO932IrSrDGR0
	S5Gn8J/gpz34oqDZf34sD3vfo=
X-Received: by 2002:a05:620a:4095:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8b5e7451b33mr1656360985a.75.1764959566967;
        Fri, 05 Dec 2025 10:32:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF083DzGWn2LEo8Ae9UWqRNGaIZu8Bc7SHuw0in/lgRyW4AhyA5NMTa/wtyUxLpleFgvwoOSg==
X-Received: by 2002:a05:620a:4095:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8b5e7451b33mr1656356285a.75.1764959566491;
        Fri, 05 Dec 2025 10:32:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c27f0asm1710142e87.74.2025.12.05.10.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:32:45 -0800 (PST)
Date: Fri, 5 Dec 2025 20:32:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20251205
Message-ID: <ggvvbyrdqvbjjf5kxvnzswwpkzsbnnjc5hsw37qreyrekheoze@p4iavaks7rmr>
References: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wvom8Nfv c=1 sm=1 tr=0 ts=69332551 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=BankifvHBk-6wX3BIUYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: kriir0azMPLS_GY89r6OBqCXrL19bgmC
X-Proofpoint-GUID: kriir0azMPLS_GY89r6OBqCXrL19bgmC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEzNyBTYWx0ZWRfX1sEV4w9oTE5S
 rT7m+SNeN4NsIvCS5GHZiF+pLJTqVSdJgx2zNm6R3Bh/VWsS3VQtZlimp9imk2Q1JVK2lT4AgYt
 Zw81Em2maLEd8bE4Og0aizluhrA4RKHACFy7nxaC7JTeNmKuXGbYc3Wo6fJIW/VuHcFjHFDE2MS
 1wbGproFXeSGxBGngKh7tcC2qwRde1oXQ3sFcwW1rCLrtqAyihMCPV+mKK2qFcYGE56nqIaOOcE
 15kiDyUHiOutwOEx1B06oDh3ircnW/4xo8TY3T1FSiTCicpWubvV/e2abxKkXs3lK00qM6TNq/S
 viJ2XVgAK7DNuSZ1p3sXp9i8yyOwyK91S2ivk0xjGiYE5J13lHQMST8Eo1LXReiua/LCTuKV4e9
 MPZfhBADYF/ZhlnXKqKrcba2k/j6Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_103249_652717_87EFD507 
X-CRM114-Status: GOOD (  17.91  )
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

On Fri, Dec 05, 2025 at 08:30:02AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> Only ath10k board files are included this cycle:
> QCA4019 hw1.0: Add Netgear LBR20 specific BDFs
> QCA4019 hw1.0: Add Meraki MR30H specific BDFs
> QCA4019 hw1.0: Add Meraki "underdog" specific BDFs
> QCA9888 hw2.0: Add Netgear LBR20 specific BDFs
> WCN3990 hw1.0: Add board file for the Arduino Imola (UNO-Q)
> WCN3990 hw1.0: Add Xiaomi Redmi K20 Pro/ Xiaomi Mi 9T Pro specific BDFs
> WCN3990 hw1.0: Add board file for Huawei MateBook E 2019
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out: https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/819

> Thanks,
> /jeff
> 
> The following changes since commit a0f0e52138e5f77fb0f358ff952447623ae0a7c4:
> 
>   Merge branch 'amd-staging' into 'main' (2025-12-03 21:05:40 +0000)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251205
> 
> for you to fetch changes up to 05c97f71a5336854054db1dd4acdaf68c5b7c144:
> 
>   ath10k: WCN3990 hw1.0: update board-2.bin (2025-12-05 08:20:14 -0800)
> 
> ----------------------------------------------------------------
> Jeff Johnson (3):
>       ath10k: QCA4019 hw1.0: update board-2.bin
>       ath10k: QCA9888 hw2.0: update board-2.bin
>       ath10k: WCN3990 hw1.0: update board-2.bin
> 
>  ath10k/QCA4019/hw1.0/board-2.bin | Bin 1822336 -> 1895232 bytes
>  ath10k/QCA9888/hw2.0/board-2.bin | Bin 218596 -> 230744 bytes
>  ath10k/WCN3990/hw1.0/board-2.bin | Bin 670116 -> 742192 bytes
>  3 files changed, 0 insertions(+), 0 deletions(-)

-- 
With best wishes
Dmitry

