Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463BDE9A04A
	for <ath11k@archiver.kernel.org>; Wed, 18 Feb 2026 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvgZL5fYRbbNaCYDrVwHrqLZUu2F2eOiunykdEYbTCE=; b=PyrxG+0X7rxZHLqvdGEBi8Hp0V
	cbpzk0pJ97w471hLJAUrEeBlQc/ypvdvPvU3XhYEwAQEWQVoYJIVeuju3Tsc9TXuyCw940lm9S+t3
	Fy26l/PfoNojsZ1zXdyjV8mJswI/lMF4lC3eHiEBo0hP/JqttAvrhtrgv+41VoODlcQkLlHaEjIb0
	an9RchqkkRFhC1mcsUaz2eb3fjTbZtBu/NP8Wyszq9SL9yxzm61VOWJz92SUYoPZXpAjJoh9B1jOq
	/Wu3NjvC+mqya1swDmbdqowBwDG0yYsu0+91TIROKs6plUQzbzVAaKUN9X6M6ur7c8MeAx+dqkbUm
	ACX4xZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslqj-0000000ACN9-1zqV;
	Wed, 18 Feb 2026 18:00:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslqd-0000000ACLg-11ZE
	for ath11k@lists.infradead.org;
	Wed, 18 Feb 2026 18:00:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IB52uJ1625018
	for <ath11k@lists.infradead.org>; Wed, 18 Feb 2026 18:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gvgZL5fYRbbNaCYDrVwHrqLZUu2F2eOiunykdEYbTCE=; b=MkXkkUXEWW/YoLul
	fLyS6tzl1qWnX+rPDYn2snJDzmzNC1SAaR0FvubdOJTfpa7lee+JOrHHSCgx32h2
	qEy7VTfVtTwyX7pS8qdKu/YjUo56NhRHZz88gZrv8pGHc95Imuq/hB6pfVd6NkNE
	0ENAUI9r0tb7PBeTQMeu9bd/QA6cwVzoP5Cm2lcTN/65I8ceQ2u27DYYSk0uTN7K
	FnAKP0MLc+hWD7ZYxv2R0T63M6ngpkJiJlL5Kj1VnKoxvTC20KqWuX+DWWdPFX2U
	uR0SOpA1fHF23v9bzdieZ6rBeEYTFK30Zd6fnff6C7SUoi8lqDvQuzawZbbdSjdW
	miEcNg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7u94s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 18 Feb 2026 18:00:26 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4c7afa9e0so2908154a34.0
        for <ath11k@lists.infradead.org>; Wed, 18 Feb 2026 10:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771437625; x=1772042425; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvgZL5fYRbbNaCYDrVwHrqLZUu2F2eOiunykdEYbTCE=;
        b=QXiQRBRsvEp4Ho8y5ZS/Xybun/af5jswUkK0evNyX73j1Wpt6DCa4LiVkotONLYVP0
         sErhgOSH18SVdBzWJP9dc5hnHxufz5EcpgpAqTRDqGCK2Q5R0FPckhk/2TcCenX/cD6M
         xnLXikkyqVcr9U+eRYnFAaqTU0xkiVF1F13Pa6yw5/pPqwgw5HmBaW96XGtGtPrI4sgK
         I2CoChJAqdRebBRdPlOT2VUb5hkU7WeujrlCfQDDPieMK48TocRGjwQGnuL2hIMTOfGq
         xF9SNxHCzR8d7Fu/eKK0CYGboioN9NTwlSzCa9LqKTbLTPS5QkWS7dN42OJi+q7gpPEW
         vioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771437625; x=1772042425;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvgZL5fYRbbNaCYDrVwHrqLZUu2F2eOiunykdEYbTCE=;
        b=gEPs7I1oKoKSwkWx4/QL5E+kFxnZH9G0F0hvJFW0j3bu+Q7JzuXHypNsF2pI0L5DG3
         qdXumAiMMWsBKgUdvelNAQ5NdmFO6Lrodd4S0w2eumU1oXmJo5oqllBsf83xk0fajYtj
         FsuvVwOTmPp6iz1PgKH5kTGIMuVkmL5hfFgh3ZNJmVxEY6An1BBNEucL03hZ1j888KWE
         vQ3+R6x/STNzrRNQme3uFgA06DtAT7/rRpqbNelJ5hne+hmrvtfz9mLWlSoVIWIcoxPC
         11muknAHhqCh6hl4RL8oR0iltC7FD6fOpb0QfiZsmH+07PnRDN1NzftVLmPaxsOGOzQB
         RJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVB3W6ZyNzgMcv2XVuRJ7OePFgw2pf0KkyIc3PfOnbBR51acz6WT0jkaqYSy2RXl3GvfNzW27E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUG9by2UwSlF1faTm5lK0VrhIP6kIZJQBcxwTwLb76H499qFic
	wkS4XBckJMuSxgwkg10cZSYNXhRj618IU0lPK/fNa1kbVQqYyK6pobbzJ8LvMUlzXeopsALdWcf
	EoFgc+SvfeNllxYuSxaRKLAR6xXYRYuEP8d3jdH0I22EBMd5lV5SjjBFsb6dhtoUR
X-Gm-Gg: AZuq6aK9WH6WFg9X6hvqPlhKsB8xDTBkjg4aNPUo0GFOdpsXaAMUnftMT5B72CQDcpn
	JVFbwqvfvC/z5HJYQfxibwL0hk33FcnACwDXNGucGgdxBQaKAKhUFDlqU6GTWUk8FWjh9EKmGHH
	5AtLTccMoWvyFjpdlZwrG1ThRHHVlUfrS+DbPm9ldUfT/QTlyVjtL8fUqzGOIBkXeqFvQOnctUO
	Jc2/AD4IutQZNwN2TCaKnnst2N3d0U8We81jofbbXSko4D6hKRnya6VMEnoq0Uk8J2J8aUTfaTQ
	4fgj11gRzJLPNqCiTcL0U48WV5sv6q49HiuVzjVM9oyD1CH+Tv1qu2zeF3ot4YBixiRtjv8M9O/
	jCZVkR37Z6uA+rEqpKfFcqVNr61LBkMtlpJJUDM6/w0TUlu28IH6C3lbCyHaBOv8H9e7bx+LqjP
	/qfD8cjQ==
X-Received: by 2002:a05:6830:dca:b0:7d1:95c7:f4cf with SMTP id 46e09a7af769-7d5127d2d67mr105906a34.14.1771437625507;
        Wed, 18 Feb 2026 10:00:25 -0800 (PST)
X-Received: by 2002:a05:6830:dca:b0:7d1:95c7:f4cf with SMTP id 46e09a7af769-7d5127d2d67mr105892a34.14.1771437625085;
        Wed, 18 Feb 2026 10:00:25 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a754b4bbsm17960110a34.11.2026.02.18.10.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 10:00:24 -0800 (PST)
Message-ID: <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 10:00:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
To: Bjorn Andersson <andersson@kernel.org>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Jeff Johnson <jjohnson@kernel.org>,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RY1LblXKItHVIGB77cFOgda9aDxmlSbC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1MyBTYWx0ZWRfX/hdxIlUP4cGe
 39Q43VtFXbTLWcMKOyA2b8asEToDgxL0+UstLZhmOy0Yuth3Ldr9f6LjX1c6dGuFDMTvuEITaLt
 R5Ag9eXLWu35uMafTcO7sOt1eSk8z1Uw2bFXbWwZFei7lIT0Gvc3t/nJbnmFiA4IvDmh4hgKJYl
 XeGlILC6zr9JAoJvjuiyu7866fy2e967C2oWLiDRV9RGS5SZVCwBNGf7N5eVeLxulaa9HCvBr2K
 XhmYTMNlH4KhIdMVT251DYQI8GvCAbfA6xwSStLOnIsmT4Xcu4+OEYxTR1KSdX5Zc3k5y36XaGE
 RYL+WKHbnXNbdEO1xrOyIGMWAAojYq6cvKKuSHGzymyJIS5Ev5cihwkEDLCquZGUZ54tIoV5gVI
 caUZUNiHMxLjxnBgjpZ6RTa4gRyifHv5JVXYwtOUUHq/twOTDTsqg8JPxLs3Z9zcaitT4obEJuK
 lmjTcJ9FCBKFzz+lekg==
X-Proofpoint-GUID: RY1LblXKItHVIGB77cFOgda9aDxmlSbC
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=6995fe3a cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=vZmAtJSpd1NQ6jeXC_kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_100027_329130_88FF55C6 
X-CRM114-Status: GOOD (  13.02  )
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

On 2/16/2026 7:25 AM, Bjorn Andersson wrote:
> It might very well be that the underlying bug is my expectation that
> elem_size should be reflected in the struct and not only in the encoded
> message, and hence what I wrote in https://github.com/linux-msm/qmic.
> Perhaps the length-specifier of an array should always be u32?
> 
> @Chris, what does the downstream generator produce here?

Is this behavior just constrained to QMI_DATA_LEN TLVs?

I'm looking at downstream Android WLAN code and it has the same discrepancy,
so it appears the code generator is always producing a u32 member in the host
struct to hold a QMI_DATA_LEN member even though the actual element size as
defined in the qmi_elem_info array is either sizeof(u8) or sizeof(u16).

Does this issue get fixed if we change the member in the host struct, i.e. for
the issue mentioned (that I chopped off) modify:
struct qmi_wlanfw_request_mem_ind_msg_v01 {
-	u32 mem_seg_len;
+	u8 mem_seg_len;



