Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3543AD4A5FD
	for <ath11k@archiver.kernel.org>; Fri, 16 Jan 2026 05:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zc4GU0JhD4P+ys3iMpcjRHxZfyEWSl8TTgK4sP2oY7Y=; b=mXj2w/3qFp2J78L9Tx5zJQAxDB
	UZP7z3ypgIvKO8K/pQra2bjhGBMR1LhJrNypfdd15AVtf8bb9r5MhBBDiR5iLpoM7Rjo+GPzkHFdB
	PX76HrCv4ZT7bIVLNjRWLRg2ODMYE0dykv7A23ifgVJ8zShRiENFw9dOcR4hocXbfb6E1PS34cfBD
	ydwAOUHKIODhOARsG48MmEHMN99ojDBSZqWYlPE91FJyGghYgMFRdh+8cchFjM8UpTDSmMbYYpb+C
	SjZZG4BOo+rnHgToyadg0K957xcOO14u+8U6566NthkZJQPndfmrc3MBbsFgIay44FM/bNi51tkyV
	nG2qG57A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcV2-0000000Dd35-2f7G;
	Fri, 16 Jan 2026 05:35:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgcUx-0000000Dd2f-2laB
	for ath11k@lists.infradead.org;
	Fri, 16 Jan 2026 05:35:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMgAYQ3076690
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 05:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zc4GU0JhD4P+ys3iMpcjRHxZfyEWSl8TTgK4sP2oY7Y=; b=gwI5RyyCDWavmM4G
	RJTEu/1J6vn+sEOfk8AeeLB8Vj0cybf7f+uN3xjWfkAo/kIVuORRqelAvtNRBLv/
	G+mSxZmG3gxAlupNPAE6FxoH3mRIB7ON3RNo4PESMD0mKSIO/fJfrERxgMBZ+bs1
	TbskeQ1jtrqTBb0KKYv3FB5rsZZPJbF6hU3Fb/czu2eY4brUxmZXCYTHcp9WZhIv
	w/H81XZXoZEyDt/2peDiBmLj5z1niJ+ietgh2BQDtoPs74ynNNU/xioeu9yl1SkL
	7ipsokCnPcDPceyjwPoyrwya18QPdBxfGdrMe7uQM8kbDDoGsDDxtad1RCNyjPHP
	aRUrXg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98jrx9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 16 Jan 2026 05:35:50 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-123840bf029so4013953c88.1
        for <ath11k@lists.infradead.org>; Thu, 15 Jan 2026 21:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768541749; x=1769146549; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zc4GU0JhD4P+ys3iMpcjRHxZfyEWSl8TTgK4sP2oY7Y=;
        b=ARArWeR/HXhwRa7UVCV6f1VWhsZdZ2UsJZlSif9KKIcvdzgSVuVhQXNfuT9dXwfoF/
         w/tk175Xm5nzadq5bQVcy2WLCQcWFReIFWX2g1vl3cmYFibDKVHySbQlZzy7aQsWFk9z
         wOArxYKHWupS3lDPnvjG0UMT5j4aBnflAyv0kd3Y+3ym1bNPAL24wp9Uct6SpEny3bG9
         1UD1aZEre+lqbeK5s2jd6yfov84Oc4yNlSr8q7ttEtfe1fCf5qZWHfxNuKJ4jIV6FDLb
         n4Q9FCNgGTwqegeKHKRb45N6OKRjdtArbO0BmIt8oQg3EuQLQjEptYFlMVB6gFsOIUuw
         pQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768541749; x=1769146549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zc4GU0JhD4P+ys3iMpcjRHxZfyEWSl8TTgK4sP2oY7Y=;
        b=DpcSOL551nxyHyUH8fDEbFJq6hSG5Ci2tr7VNLH7X8vnK8OZnNUBbXN/dcQaGfdI2Y
         RI3eRnkWLvV/v0lc454jaGjKNLEkQxh+JITyCqeI5f4H/5zslG0gssdeHU9XqHbNGEEG
         M4QP4iRfMrEyBGU7iZJIg0viDs7pw5ZdU88sUGzmx2ybySbtUch8UKXOEGfYlfUyIU44
         RTZVXTz5O4dP3zQ+90Ysa2pOzqRfmzqa7qoD+5bJPa1Kd5PwJl0Xk1J5sRIvCCR3+Rd2
         f7HRqzjlM+D84b1iW13H9RQeSiR8Y5TTvnyuWUHPN8s0Gg2+x5StLhHDm5rE+9fwUrJ6
         nkJw==
X-Forwarded-Encrypted: i=1; AJvYcCWbAwViSfnamP+3bZGCqODBLp/ENPJCUt0Y1s5DPizd74jxZoo0rU3CVAdy2skZnQskj60flSs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsQY/gyAt1iy2+IngI5SJ7Kzg/27OqdVqD7Z/jDozH0EefbJWb
	A9XWEr/HDNRL3N3kpn0isyG/fyNz1Ra9TRJGwTEDzIwZHzIBxq43GWvpJ6bZCX4jXE8RZGui0Ad
	93XnuD2i3K0qAOO4fJMFEuB/f6bECL/vI5VsKNluP4nOzNEG2nWYAyduMRkR3ExAeFsXQFqZv
X-Gm-Gg: AY/fxX5UkU4nL1gAj5iW5gujF52x1klmVjNUJsdsHrtFd93f+SWhfsbG9o6tPFVljui
	HT1hulLAS2IkAiuEcHzeJyImPj9zHLvTFgs3C/bXPOrPIpVKP6wCNbfCzeKUr79uWyYfzks34bi
	pw7NmHbLgz04usLJKzOydZvRUgvdYumMlLNergQOV6qN2xsjFWPGem/i8rlAsa1ivC1enBgclpM
	7M07XtTU97DMKUbZwZ2IogWJcsd08ssLzX8Qa2hZ0h6dFFsvI5RNFJsYKJhCM0/t/8rMTrxZ8Ur
	yzjhrjDAnexh3Gz0cmY5LiWCU4oMVWuY2ADBbxf2P/+y877ZB2mToyXI0h+wvGPRSa0xGcp/eia
	mkazzo8RBaWZsiAZmEG+f8kgBUknj7p2OgfFmzsK1O4FCyZqCWW5FIdDbmpYqzUPfsVc7CYhGhv
	5f
X-Received: by 2002:a05:7022:2204:b0:11e:163:be60 with SMTP id a92af1059eb24-1244a75eb15mr1951978c88.31.1768541749000;
        Thu, 15 Jan 2026 21:35:49 -0800 (PST)
X-Received: by 2002:a05:7022:2204:b0:11e:163:be60 with SMTP id a92af1059eb24-1244a75eb15mr1951970c88.31.1768541748488;
        Thu, 15 Jan 2026 21:35:48 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad72063sm1626095c88.6.2026.01.15.21.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 21:35:48 -0800 (PST)
Message-ID: <3037eb6f-d17b-4984-9c12-a3ae5e373595@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 21:35:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v5 0/6] wifi: ath11k: Add single shot/periodic
 CFR capture support
To: Qian Zhang <qian.zhang@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Yu Zhang <yu.zhang@oss.qualcomm.com>
References: <20251230082520.3401007-1-qian.zhang@oss.qualcomm.com>
 <717658b7-91da-4073-a746-a389319aac2d@oss.qualcomm.com>
 <a7a73ad1-0761-4abc-acc9-fc94a4e77348@oss.qualcomm.com>
 <f0e98751-8fed-4cb8-9cc6-59a691f172b5@oss.qualcomm.com>
 <0f4fa27e-d9b4-4a23-8c8d-53f4a7014167@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <0f4fa27e-d9b4-4a23-8c8d-53f4a7014167@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=asW/yCZV c=1 sm=1 tr=0 ts=6969ce36 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jrv7-BdHtB984KKGQBAA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: utFqOiwoUiTLo-DqYWPbnTO0AFyD-3Jn
X-Proofpoint-GUID: utFqOiwoUiTLo-DqYWPbnTO0AFyD-3Jn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA0MyBTYWx0ZWRfX7lsxrS/et5eb
 QCwNJOgNvyGIhf+3fB5aX4LFvw8qp+wkr2QLXeiv8kvAoeUEpaU5gEQa30ktY7rHB4qiMb09vJJ
 h3eHvCWadWxK4wFAqTbYlGMIyhCyuy/fPQy7+FnOaJ1ZT9F07WW5CVdTKONMBwrG+B1PkhNYo52
 JB+U0pzWOcGuhrThIkp8BdDFTyEc7grHNqq6u071aAJcvBjt+r0mtFQySVCcEa61VU2F0jWRgKD
 AU9e8rjYMp4fNT2/BtBFi0OE5jSmJutbnQDs0KPjZWXleh1r5jzOLt1PL6YmtyBSqh1RS+izLEo
 gUpDDxOQllApIcfrN1yOho/4s5Xp/Uxi5luG/+WCIU/HoYfWmwNLPtwV/CzIfS9VFJx/xV96Ox7
 qyhtwhq6axqqfhi9k9Fxiy7ZtlQ6KEaGqR6q2Z0NKMDqZzmUVGu+tmH/7y+Q129piAnWiuegOxr
 /6tIqwB8CqiDa2OgTMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_213551_837250_90B1BBF5 
X-CRM114-Status: GOOD (  13.38  )
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

On 1/15/2026 3:47 PM, Qian Zhang wrote:
> 
> 
> On 1/15/2026 12:55 AM, Jeff Johnson wrote:
>> On 1/5/2026 3:51 AM, Qian Zhang wrote:
>>> On 1/5/2026 10:22 AM, Baochen Qiang wrote:
>>>> On 12/30/2025 4:25 PM, Qian Zhang wrote:
>>>> what are these dependencies? They are not present in old revisions.
>>>>
>>>> BTW, if you indeed has dependencies, in addition to these prerequisite-patch-id's, please
>>>> also list them explicitly in the cover letter above.
>>>>
>>>
>>> These dependency details were added by mistake, and I will remove them.
>>
>> Was that the only known problem with the v5 series?
>>
>> My automation flagged a checkpatch issue in the 6/6 patch:
>> WARNING:LINE_SPACING: Missing a blank line after declarations
>>
>> If there are no other issues with v5 then I can fix this in my pending branch.
>> Or you can submit a v6. Just let me know.
>>
>> /jeff
> 
> This feature is under LX test now.
> Patchset V6 will be submitted when testing is finished.
> Fixes for new issues (if any new issue are found) as well
> as all previous reviewer comments will be included in
> the v6 patchset.
> 
> Qian

I already had this in my pending queue and pushed it to ath-next before I saw
your message. So any fixes would need to be separate patches beyond what has
been merged in ath-next.

/jeff

