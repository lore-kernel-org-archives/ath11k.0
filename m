Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3324AC531D0
	for <ath11k@archiver.kernel.org>; Mon, 27 Jul 2026 15:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t55UHkGONOFnSehAuIawlCkYek1fcr6fR8fbLk2bM8Y=; b=Thvh0ko5Wa56XU+v2j3rwQUyGX
	niUeDZBp5Vtb+REYgExqd907yz8iUvqw/7ytcEPa7pN3vHTlmpIGpgER85O8Ux9LAFmu/ucCHXiGl
	weicd/SpntWv6aq+WVNxV1JJ1NnGRVHEfXxW0q3NAUjudioIuI/saiG4WfgoEix3liXs9dIEI5Eec
	rbbSFKQNO/MzaIkb4PaOEkr0Jx6QuskIwfkbqFRlEcdOPTBEeiedEeG4/MNMuE/oIvABX+xA4y9nQ
	bqgMl/rNIDSg1Ygj5vdybktlvVYbvkW3nkIqIE8UrHbEDKo+JXqQAc9uLJ10BCUF7GOp9TUsgJM1x
	9mmJZDfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNY4-00000003DsR-1sX8;
	Mon, 27 Jul 2026 15:47:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNY1-00000003Ds1-2fYO
	for ath11k@lists.infradead.org;
	Mon, 27 Jul 2026 15:47:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlZts4115088
	for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 15:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t55UHkGONOFnSehAuIawlCkYek1fcr6fR8fbLk2bM8Y=; b=oQ7Z3mpIr0YkTn6k
	yKI7HSvDosJeTafL3XazcyU2uIq8Hj5lqZsDopzpPhSQPOwc2vozLGir0pYao6dh
	URTK55UXP5moxzvEqJIaGmXASEk0CT/NQ4sDC3JiRobeMKSdJu+GFHtP56Hr/r+L
	yyETqSk3q4R8KVBWNOcF6UGN7+IXLfJJHV2NKVjYVmI9U+TjehesEyjliwgAFi3I
	Kn6Dml76Ikeag+RTGN/n0xun79i69TBTv6wxbveiLiWRShfbDhP45E0oiABZFTIs
	KkVP/SqC7lxL8yXkPOKoH3wPoYiqK+AtCYGrSlym5Czx5VW9tSA5eqGMecg60kYl
	LVI1gA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrshxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 15:47:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso78779155ad.2
        for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 08:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167239; x=1785772039; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t55UHkGONOFnSehAuIawlCkYek1fcr6fR8fbLk2bM8Y=;
        b=E5clRJWeZIktuDglPR7uzf190lN4n3764tGI1v2mP/m8+ZPLHP3cQR4d4PzGr1tMOs
         2YzofIVOa4TznbxlxKgncM9YbJNf0UnO0l3fnKy/+sqjFpy2DcYWaX9ETXasnvKjMXsB
         RifJ5uzFuFDtzQp3WS40vs86fpV3/TRlQ0Ph5tyTrScFJYvPqnlEqv9F+huzgKCPtlLx
         eyRCcHDufbGNbchY6iFwtIXuu1vtAJhJ59TbiBxeuMJLXg+EqbyKTPSiqjlyJgl7O/01
         CQzbGNDhY087Pzey/pBDeuWyECQvW4qC3h5gSYvcAU69H/Tf2PjgXvzNXzaN9HZUGUhV
         zP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167239; x=1785772039;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t55UHkGONOFnSehAuIawlCkYek1fcr6fR8fbLk2bM8Y=;
        b=kdQVAhjr5CXM3AzYTqjdbcl3BAj2c3pRrJGgUh1bNLY7Z09RKHiAP3XUHbN8ZKXMHw
         1RHMPrbVYq6EMJFaAk3SJhmaPo2fVV1SKRJe4CFiNI9IklYe/N1DnBFCvnO+8v7EDZ9C
         /DtmvowKucXmKPUg+GQXAA2qXJpaq1uoBaV/W9nI8gsyMAKfoXF7tPipa3wDHZYuMy3n
         I+L5osLUq5BO9VU7iAJeiNU6+brIbhfzc4K53jIkijTOTVGh88pEwTAO/PmvEpUsHy7E
         UStFvk2YP3IVHzHbbCoe+0+h+eJeco4Z1lb18IvV/s18dZMRE0M+4VBV+Ceb8aJszQE6
         yjBg==
X-Gm-Message-State: AOJu0YwYM4Nn8xqWLZ60637VDd2WcNWCurWtTpsrFgrm5y6eJ3IpWo/C
	eIMjhsQq9OiBP5Ap1hbDIVnKBASg0F35ARpq1voY1fPpFoIFG2q7x+pXdw3VNOUKlolQD2kDhl6
	Mc/kBElHEStoOwZkoEiAiOx+/uQ/hTHhkFUKqB5OkaNELvwdaCESWm6q6dSspMNogVqI37J+K
X-Gm-Gg: AR+sD11OgPZb5WlFljj5MoW1oxBN5TBFRzfi/OJx85Js+rqn6B2VNKVflHwHR7u6gjH
	SJsQbTls66vygxiEUzEMrUWv2FkeMrx5ND7E4FJVFtStaoNIXG7+uSdisDkz1igfwz69VYF+tr9
	Gc/4dTMg3vL07oBtjCD7R1eHWd5R1eO8aSFTtnP9mYfS9HUegIAAHxXVdzmPArlZvT4ttCxdXk8
	IJWgxWzkPy0+vYujHvOdzaiNVta44YqjgairbU88NfAJE7Wxg9diuuUjbtCrRSCLcn1behR81r3
	YVW+Dzc2yxZ0pSBa3cNSd/A9ZqEujtvLDMQFSL3M1aUzBimKMueoe8puVXRrQWRfb3TJI7at5S9
	f+1Oyrt8xzmVUBGkBC+A7KtXfHNo6HgyXMl/GaZPpZ35vfAN7+AAlVEmEPgES
X-Received: by 2002:a05:6a20:5484:b0:3c6:55f5:2bc9 with SMTP id adf61e73a8af0-3c67df10d35mr9526503637.49.1785167239081;
        Mon, 27 Jul 2026 08:47:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:5484:b0:3c6:55f5:2bc9 with SMTP id adf61e73a8af0-3c67df10d35mr9526477637.49.1785167238645;
        Mon, 27 Jul 2026 08:47:18 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6461ef84sm16043901c88.14.2026.07.27.08.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 08:47:18 -0700 (PDT)
Message-ID: <81a72170-870a-47be-930d-0772b7934ab2@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 08:47:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>, baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
References: <b6903572-52cc-4c41-b9cf-5845e387c176@oss.qualcomm.com>
 <20260727065500.3827035-1-zhaojinming@uniontech.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727065500.3827035-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX/QVRGa0aYuAY
 P6CuAsLCHhnmZLLd+q8A7AZTIKEHw9A4m+2iOrbgSOphsh8I8AK7yQIL3HqGuyULKu1Sh3kZEbG
 hEFmZqq8y16R/apOpLvXa/QqYop8eAw=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a677d88 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=RgswOa_aB-mjHIJR3Y8A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: smTb58VPn3YDwuLaHNL9vKD3ZNc0PECM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfXyIsQ7JUKc8a1
 UgZaKNnNoo5rj451c5lR0tUCjCoit4wkyXej1zAgck/sV2uE9Ocry7W87gxnpV2+2et+X6NEEN+
 EujNwp0jfggCyhxrcDi1vtpcwnmd/8HGahbT/zEyVeOzwoV///D63gdRmyekApbY4rf/UR7gEyq
 BQNC5wS5uIMO3fkXTrAqOzhDXUOs2Qx0THuJS1N2huxxwD3aAyPgw4Pl5rm6fhvoobCi1P+hdO4
 n0cbVKVaIT9F4u/qfB622XQyWhTZwHWhxpc+15LgydbylTlXB4G6+I/w1L8ECEZmOLySysTv0hu
 MNe7xF34YYlsegzhbGsIBTUH81SD8B058M9A+9FMl5J0UZ/cNY0ObaLNjNNt7BHH7VFY9dF3PGf
 3IV86+fNTvpZ0Q8jsceQ03v7vevX7srypc2D/WrtxvixLniUjdQYlu5oQbioXzbKsb1pX1pDQX2
 7HZgqjHp0q5XEUGZCLw==
X-Proofpoint-ORIG-GUID: smTb58VPn3YDwuLaHNL9vKD3ZNc0PECM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_084721_796732_5C0C64D4 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
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

After v4 I reminded you:
>In the future please post new versions of patches as a separate thread.

Yet once again you sent a new patch as a threaded reply instead of as a new
thread.

:(

You are ruining your reputation.

/jeff

