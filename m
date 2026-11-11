Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EC1606A31C
	for <ath11k@archiver.kernel.org>; Wed, 11 Nov 2026 23:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qJ1v59Yj;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pR2go8KS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TGDKvOkM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BI8HS9AREBj8Zs2KSOsW86Cb8XsVKb6uk4HE5n8nZVE=; b=qJ1v59Yjg48qKj
	09UIZPIJIAonADKswayVmK9R6nzA1FtGGVxXg3TmZlhunsWsWLN8WbfkdyN3TbMSEs1u1sjP0iJaD
	6SXap7VE1oaHFaWUTtt8lsYUzwxbz22HhrVzN1ew5k6BsIv9mHP9aSjWQY7OIUFlw9P4bomdqmb+b
	RCL3Usi6jzOrMouaEXkmuYGDtzWpcxZwXRBRvqvxhFKRWoJTmLunC4rVhkUVshhc8f+KGQV1PGbEQ
	3pmaQiCVK89GuQFbReY9t19kdbNjR5vm+BPEEdbKfvG+EJbSoxsbYntnXYN2nPynW6+B7bY+SPPzp
	C6RC1TTHYQI3zRb0pr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIDl-00000008CS0-29Bp;
	Wed, 11 Nov 2026 23:59:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRIDj-00000008CRO-3I9N
	for ath11k@lists.infradead.org;
	Wed, 11 Nov 2026 23:59:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMaOlm1623022
	for <ath11k@lists.infradead.org>; Wed, 11 Nov 2026 23:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BI8HS9AREBj8Zs2KSOsW86Cb8XsVKb6uk4HE5n8nZVE=; b=pR2go8KSTWSrFOsn
	sdDzpW4cDZoe9sWhRxJ93Cz7JNd0UBGPyP75iL8+OhN7j8PgMzIzfnGI+7Eqo/Pu
	Re72uPGXVvY1DbKbToj0ISrvYaax+D+sfiFYB0Po+N+rBu+nDiWRADx5K5wgFg5t
	zN9misA1jp+dV++v2S4F5KKh3aQwQkHMnAhZerbM1Xkq7B2uNlErdGv/m0YaM6Lj
	i3xIfEAdevHA89t9rYf2Zt4rQmnpMIS/fLggw6e2bS0OAfQ+dHH2L8hvQb2SWQ+e
	xbF3zxIhmGwS9rSMRsNzEdORsjKmOB1OOT9bJROWNxOcc6XJk73JL7HRJp0giq6m
	Le4LhQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjju4m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 11 Nov 2026 23:59:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso5327191c88.0
        for <ath11k@lists.infradead.org>; Wed, 11 Nov 2026 15:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794441553; x=1795046353; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BI8HS9AREBj8Zs2KSOsW86Cb8XsVKb6uk4HE5n8nZVE=;
        b=TGDKvOkMk1ifoTZ20sL639izE7LcBpBj9QAkF6a8xk+37kl0feVs/BKO0+Jtx+xTRv
         FzGNZovzBxRVjmDOFBvqcbqJFUN93HyCMhU+7ZY08MEIEChzEpwtSHSjAUo+D0mQG+f3
         pPj+IaMjyvJpEt1I46zfVWSPX/8dFBeMMnifwN0o7c5YHAhayrpGZGkYV+hjsw06OHyS
         XQGPkcICfF2gugeDVeF+lQDfPEu6e0TIVDYjWj4SQ4nIAHg+y36zDzAFHBU8haYQUcE8
         6ojYFyETYly6vWeOmfbZrWfBmcZBIfTY7vawF/X4ezzFsH1f6pBpCjk54QW3boPcEC+L
         EoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794441553; x=1795046353;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BI8HS9AREBj8Zs2KSOsW86Cb8XsVKb6uk4HE5n8nZVE=;
        b=FBrhsndf9oahYffCSYnPKPZcq8seMnE8IXt6m1MsfySbIQddU0WWMKFkzozNFEK4rk
         XJp3RqGzRw2Yh+VVuDqQ4sDMMLaNpRaiak2wXXWSYchNfRrdRV4RnluuiC/8zISNOQSS
         LW2uLN7Nb1LrPpWlknm16Emb3pGQK1sb4o+fVcglZaVwsZ63jVDfdPA4opM9P46kR4/2
         inaM2XkD2IwGZ2U7gUvRO9ZBXWXZuBo7ufFQFWNt+tmMa3DL5q9xReTTmok3BbQhAFVO
         3sTAHjXlbR2mIYf5H5aZuL8RPi6OIaWpu1K9jZpr0sJwLJumALxOsFvNlGiJ9eAtgpfk
         v23w==
X-Forwarded-Encrypted: i=1; AL+hErE+TrlDXdlASaQcNS7KjP1uk/3XgsL/AKK8KHqosQTkcfVfSym63AFgjaHnpmU6+8TzaZgdlA4=@lists.infradead.org
X-Gm-Message-State: APuU4Z9ReklByiLl41zqUOk8yuVY0EzsssYVBZlVl9groa+nbjOM/qPY
	vlOv5g4Dk4LfB1NLtMaG9uFUuAOdS/txrcyJO1ooMczTRZLFV8rEt5IzML3/zxnIWqljBkqaM/y
	wvCA6DIgodPPGpSLWdRtbzkqD+Vk63vKVKB5y53PcuI+S/DYvLmGspyCWEZ2n68W/+mop7d4f
X-Gm-Gg: AYBFou0yBmuAXVweKBlwBgKDDj6of10Ox8oaPRE7c+dlgR4yqTOuRzYqOSIWrOofBan
	xuOG146g88Ve0aDQ3eYkgNjAAErFiTAAPcJSyINoAUuyaHpCCAWipVxd7rUXuMyYB3hjiw69PGP
	PNDA9Oif2iTuvDaNAc61+pLBGPDUPe6zflJDQt3vdrUf9egxVCxlzYH5VhFBn7i0OC+VJIW8UIX
	MukQNu9rfafaihB6541sLNCLbEiG9IbvsXD8B/C4w28YlWTFTEMcJqBkIBeqXM9h8AupkkxvwLu
	0WoUL/Pp1uKguZc2Y0mFqamwhpqg524V4+yHKg35yp89n2xWC109ZhlcryS3kq3b9lFEEFHmfvy
	eGbVkn2jiIYbtMYGQFdXTaV0zvMXjcLPIkxeqfA4CboWSDLpeFVfhBKAX0tLHMTzIxYQRYpwRYx
	s48nEjt/GGGNj4rQx4TYCBaPyuTMbH
X-Received: by 2002:a05:7022:eac9:b0:1b2:43b0:4794 with SMTP id a92af1059eb24-1b3c02fbcc9mr4282404c88.9.1794441553007;
        Wed, 11 Nov 2026 15:59:13 -0800 (PST)
X-Received: by 2002:a05:7022:eac9:b0:1b2:43b0:4794 with SMTP id a92af1059eb24-1b3c02fbcc9mr4282374c88.9.1794441552287;
        Wed, 11 Nov 2026 15:59:12 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4efc2sm16960422c88.15.2026.11.11.15.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 15:59:11 -0800 (PST)
Message-ID: <d5f3296f-6ee3-444b-8310-3912ecfd1c8b@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 15:59:10 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath11k: require unique station addresses
 per radio
To: Patrick Lawler <patricktlawler@gmail.com>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20261001164139.370144-1-patricktlawler@gmail.com>
 <20261111223509.283556-1-patricktlawler@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111223509.283556-1-patricktlawler@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA5NSBTYWx0ZWRfX4SQ4QinzQPJw
 PRceFBl1jnbVfiWV6IdqBvzlJIDTLYjDGheMvTx4m4cWI30SgTN0J/50AUBzWSernc1IQxS3jxj
 bsmq3WqfZK1ugNPfBcaVZ3ZWT3ocPviSQXK+yQ3pnStoE9+/ON0UcfjMWgVIEdvMl3YAad9Ru22
 lJIB6BbqzXv9S2kR56V+s3ji5ZVdPqbbK4gfbLVDosIE1pVv3Ow0B8fFBoRGaJOroOcbK+FP+gB
 eRpyR6y+ceTd95cGNaA1KrXBYHJdeC+9SuhXp4UYgNpYW7SqPlhpXCfMLLY2DcHYrYGDucxGhFM
 t/heItlfUTfeHykKi04c40LTISs9whwG5Y5O3yEIouPOGCVaTcOBD05bwSK35H9XhiMjw0nuixb
 QjPhPJPPamrjTFms5M+ybzf5fQCelxSp5+djvt/ZeyXZXqZZqub5pwp0obR7Yn9PWVC4PzcdYsm
 zAi10CqMM+ecZ/H5Jyw==
X-Proofpoint-ORIG-GUID: 76DvehOtHvI6zSgz7zPv6bvaAkIy_81T
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af50152 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=DliMxTWXI1x5dq_kkzkA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 76DvehOtHvI6zSgz7zPv6bvaAkIy_81T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA5NSBTYWx0ZWRfXzCpJVXEF2bR+
 HlEesJAijgCDmvHLynw8P4rPHiU6gN4Jd1+oBxw2lJLEk8YHK9lripjfuN5jp3EpyD8OL3G7c/3
 VPqEf4rmD3Kfl7HIj3LvJ7HFTX5P01w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_155915_961864_AAC8B5F3 
X-CRM114-Status: GOOD (  11.90  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/2026 2:35 PM, Patrick Lawler wrote:
> Hi Jeff,
> 
> Gentle ping on this one. It still applies to the current ath-next.
> 
> If you would rather have the driver-side check from 1e744bf218b5
> instead of the mac80211 flag, I can send that as a v2.
> 
> Thanks,
> Patrick

I have 400+ patches in my queue and I'm currently focused on ath12k Wi-Fi 7
and Wi-Fi 8 support (both internal to Qualcomm and in public) along with
critical security & stability bug fixes impacting upstream.

I have no bandwidth to look at OpenWrt forward ports at the current time.

/jeff



