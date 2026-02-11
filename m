Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F630ECD6CA
	for <ath11k@archiver.kernel.org>; Wed, 11 Feb 2026 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0QIsK6mPcCOU0kcXwkczmwSwlCiukRDmQU+5tux8+8=; b=mPq05NI+aDLCmENkf30WnXD8dj
	CBBxdI3nsIU5isLkkf2goNsJVRGw6uoK8xv7oRsHhxAwEZv8xO5fvtTgr1DyS+64/UmwpcbcoZ4bi
	NZNVtqWMK9DXhlXyI2tEu54zHN20o4z4p/fkeQ2244uvU7JXn0W/hJpKrMWIMhhrsFrlkXe/OX1uJ
	Ty8emPkOpSjElvNaODordEimmGyDPZiZt8/AkSIijYalCAFZQ1z7KLqKyF77PtoaL38v2XSIRfk92
	0GRc/lh4sjiY4dt5DqQJvq+TnS2IwvgWrz0wTDQaAwnjb4P9/V9BhE6hGQxT7dFwBQH0kCxpMYM+O
	cErK/x4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDls-00000000sma-31YW;
	Wed, 11 Feb 2026 17:13:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDlp-00000000sm6-2bgR
	for ath11k@lists.infradead.org;
	Wed, 11 Feb 2026 17:12:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BH4oF62663833
	for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 17:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0QIsK6mPcCOU0kcXwkczmwSwlCiukRDmQU+5tux8+8=; b=lPadP7qRA3Qe1ClB
	7/+x7CVK5c0b2Pa2ZDVHaTasfd2VrjDKn+hbHEP7HO24/ZU+ANNbs++e7UOoDbLv
	Kg2yowIy2a2oV1llv9CFVYZdKkfz19s/Yht3e5+enJL9tQ9W41tf47t10S4t6lC9
	w0TBee48p09GZr/Kde0UZ5flfdPSZATkCNRB5XyzAK1mg3iYZGFN6wxT5JcwlgXZ
	MjwvePSOsJaizSQWE2dWGUgH6v8sFXT4eUKpXGxsuqFdzXZwTvz/jRVbfBntCBIx
	sa8uBdAuvAr63PLsfTKw3XBbPTh8RW8h/Nlf3qUhUw7aATSOr6t2r7DBbkfrQhD9
	Oynhnw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wus0144-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 17:12:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba9a159437so1387199eec.0
        for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 09:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770829975; x=1771434775; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s0QIsK6mPcCOU0kcXwkczmwSwlCiukRDmQU+5tux8+8=;
        b=To+HPd9WFL61TWwMffeTQsSwNzL+Hftox9W0ItOMz8F6R7Fl6M0ZjOWkivcqwFzcNe
         W7bOakEaxfbP+LO3Cf8cqT6scWWBKKZgs+95SIQi8AI1B7Cj4fmSfcFyzKFl9DfcN4SS
         h9uvoixudg0/jJUpPcaRHWa0q0JwQGGxF0zEdl5pOwi//R4gw7npo4zJCVoDJppwmwFJ
         aS1S1pw46dCe67cIkZ5ewi3GH8Ocos9eoI2k8sLoGWqBAu8YWDqWDdKnFHFt1jthvby7
         limsULnN3ViIDeSa+/z7JQpOzisaGlAVG+ZQnAlW0HJ/mEg+AVjJuhlk3lctk4AYxTz1
         /5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770829975; x=1771434775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0QIsK6mPcCOU0kcXwkczmwSwlCiukRDmQU+5tux8+8=;
        b=DibzJIGMJbvPcINo23B1xXnRpXsuwsZYFo1+k7koOx3ABvep+zyIBEqr8R2d1YTtFn
         c9nQwuO5kJK0Tt5okjg4+6H8MhgmeQXjwnR02/55bsEf6ziCVyBbShtk0Qd6+wo/HLCA
         J5GfzpIX2nwA4VJconRD7Z+x87+NW7/hrWBhZNNPoau2slCEICxXXSxXTyxScc3Fj6o2
         B9pTZmETQuJW8l18MwY+BWLZM7XyXjO0amyF54sWOI0/PmPYgFGMjGyMdGkG1ILl4/XE
         zomZczp4oukLTOhH4d2FKmQ7Ut5fpWWTaICN2RVUVx20NiqYhKI1ilF9Spd3xCjQ/O3g
         1HEw==
X-Forwarded-Encrypted: i=1; AJvYcCVTt45zyAcxYx5Xy61pHHj9pMmWvT03H0vZCE8GaPKMrz4mdVwRdxV92KbjKh7gU7PoHfUbH0M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs/bLu5haiuyNMf9h1nDkyBARr0d1Se+hCEGTqILuaSolcpsaO
	fGTWDgU0nWiHkfjV+J05PruYzG9KXZP8hLh7UyorEiAJSQYgKlgUYPYRzEXWPKQLzxR1TxBjG94
	2/MGHcyWmxNobui4rleBLixAo3osG4LP/1Mb5w+Hs6hBrBO8qTeyQrD8Sw7wCHb1RcVxgkBS+
X-Gm-Gg: AZuq6aJ72heiPbX/DOiwijmXzDx+dlaFlYaSU3y5AyQPUyjy1ND34s6457WxUUNIaDd
	aW6/Ig2H9SgwZy30Pm6NoHMV50QgHyGjQ9DxHEbsletUoKYUZINUGYRFp2f7XU/mE5i3n8QIyB2
	25NA8qp19SRHVB5mjwFSYJHWNVG6N+PxbV/ZF3OUIID54w7RFLbYwDd1S2V3t4Nt6zvjl0+vX+e
	HF4ZhcVex6SQTJfKbuX5/BqJt7EwrDa9y3XeuJ1/17M/4wFuRsVCYwrSSHu1jMADfMBRPRNDo5b
	MHqBtqZKkJK3pGYgFXjXDqVVimAtyr2leffyQ14Gv/Va3oBZnBlgQhGVTR11hvlvG5bT3q5idIM
	iBmK6TfrarcG3wbJPPzPyi3q44NjD643OCjr3D+CMKc2e7MsynDTJQoZ8Nf0DPLWv//Dj4ibUeX
	2hd8Izeg==
X-Received: by 2002:a05:7300:bc10:b0:2ba:6ffe:450 with SMTP id 5a478bee46e88-2ba6ffe2857mr4075204eec.33.1770829974711;
        Wed, 11 Feb 2026 09:12:54 -0800 (PST)
X-Received: by 2002:a05:7300:bc10:b0:2ba:6ffe:450 with SMTP id 5a478bee46e88-2ba6ffe2857mr4075181eec.33.1770829973814;
        Wed, 11 Feb 2026 09:12:53 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dcd42c4sm1629902eec.19.2026.02.11.09.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 09:12:53 -0800 (PST)
Message-ID: <a91ce058-4121-48e8-bdab-f68a988496a1@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 09:12:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: WCN6855 hw2.1: board file for Huawei Matebook E Go
To: Pengyu Luo <mitltlatltl@gmail.com>, ath11k@lists.infradead.org
References: <CAH2e8h4LH5TDhkkFpLphsZxAV=p3HcVqbDC8xCarnHZytCK3cQ@mail.gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <CAH2e8h4LH5TDhkkFpLphsZxAV=p3HcVqbDC8xCarnHZytCK3cQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pLiQwmKkG31e-ZWHIbBhGJ76AXO5whVx
X-Authority-Analysis: v=2.4 cv=BLa+bVQG c=1 sm=1 tr=0 ts=698cb898 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=2K8bFILnL99luS-DPY4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEzMiBTYWx0ZWRfX1HAG/IFlTrUc
 EBwGb2SB5vx/6dGiT5f5HCY+M+v2VIBe+u8+H8KalJIEsyFk23za9U6g3z7PKqqx/np37qWBM34
 aNi45hBnMbOHKl1N4VEW7/QADv23d4d8q+yPJnA/X8mXKd4bF95mn8mZrO/CSZa6VRiK4hiF5pU
 Rx9HTMazjVYpPwRGy0w+UqjQTQsc42gAWA9DLGirUI4LHV2tsTWzrUkdGPEFIypdX1sNRIEpOqo
 CntBsjLv6zNsPdauJUTqRxZdqpIOmVR0h0k7ovC7TWV7Du49oQIFGMomMMVr3S+cdpXbOlRLrAX
 7GhpEOPkIoDBWZuZTTIkSxXxovXHuLekke4cL4ZYJtXns59s80yGT6CcCgSAt9fb857z/owkTJw
 YjZJ2q9sQ/A+nvtF6w+IY/xdOxbdFMGr5SHaIIz0khUFVwmXFKoTRUIEVYMH5umET9UysRdvP0g
 k6Gp99ODfjwEFlT3F/w==
X-Proofpoint-ORIG-GUID: pLiQwmKkG31e-ZWHIbBhGJ76AXO5whVx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_091257_795153_6AC800D1 
X-CRM114-Status: GOOD (  13.11  )
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

On 7/5/2025 11:06 PM, Pengyu Luo wrote:
> Add board file for Huawei Matebook E Go, which is a SC8280XP
> based device, and its codename is GaoKun3.
> 
> * description for what hardware this is:
> 
> A WCN6855 module found in a SC8280XP based board.
> 
> * origin of the board file (did you create it yourself or where you
>   downloaded)
> 
> It is from the upstream WCN6855 board file, reusing the one originally
> used for LE_X13S(qmi-chip-id=2), the RF performance has been greatly
> improved compared to before (default board file for this ids).
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
> ids: "bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255,variant=HW_GK3"
> 
> sha256sum: 3ee912c4bf015d314198c7c50829deb611b97e2499c13debd736485e72c67fa0
> 
> Best wishes,
> Pengyu

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/d9e2d225ec6ef5a8e4c542f11fe26ce09483c6b0

