Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885E6606A32C
	for <ath11k@archiver.kernel.org>; Fri,  6 Nov 2026 01:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jtIigpn+;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3JN+smT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TDYq4LMl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=APwff/4lOA6lQf98tIGJwKSeLdMqiBGJL1c6dl82img=; b=jtIigpn+FCRlzF
	/NtGul0jxfdrZSLSIG1KqwPjTLR+xK2ZdfAc2oSx+BKFn3C9956zVboamb4hEGPuY17HUIRGbq6EF
	zMKudP9glq5dSNyASAgTkj5nvdU2+HJUR/HucGRfq2qTloFJDk3bByEeVhP6N/mvaWhgmq9TGS1XI
	knydrUUdyMcQrrVlN1shgbKKvT8/gvyRbUYe1TKr8almAe3NtgTrGJwJh2/aaN04Kxa4mznfQYyjf
	XGqQnlKF635cLc6ykIDv5EUOxkILrk4GKjWpQ4AUqqoQGdCOJuOHyAEsjJOoOJL6hf8V1Fy4selWV
	+H3+W8Ra+kMZbMIbpTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP93S-0000000B0X7-3hWP;
	Fri, 06 Nov 2026 01:47:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP93Q-0000000B0WT-1veI
	for ath11k@lists.infradead.org;
	Fri, 06 Nov 2026 01:47:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeNFE1308134
	for <ath11k@lists.infradead.org>; Fri, 6 Nov 2026 01:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APwff/4lOA6lQf98tIGJwKSeLdMqiBGJL1c6dl82img=; b=O3JN+smT1WJQqKw+
	h0JvABzW7yFbgbjE4Oev94p0x0/YgPCN3CGpxBpX0re/J2mBHqgP5B9TjFEjjX+O
	3AXjLTTY9U2AjMgdehKIwfA6yl6nT7ffjqTPKqkevgtofg8IdmK9Eqy3mMZdXaRP
	qCVInGDNXNYvI+ps8UOxcrFiixvy+hlAkvLOaFxBUA6jntJOK/EFJTX+Jv1Uqj0O
	vb+wEBY4X6Ikj8W/swoHnMWKPp48cayAKtSqVqbqOFp6nXPFNnCKdk1O3spvWQEM
	nxddD7S8+VtUM80H/4XF/QstMC4SDI0tJ2eJ3DfnIeou6/cES3n2PWhzf//s+DiB
	VYoncQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p98bhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 06 Nov 2026 01:47:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d2d353a5aso178115eec.1
        for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 17:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793929663; x=1794534463; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=APwff/4lOA6lQf98tIGJwKSeLdMqiBGJL1c6dl82img=;
        b=TDYq4LMlYJNAD0qUJseucmRgfEH96bRZ0WsCZMVFmFItPgPnm/p/uqEsOAQjUEqIiL
         wdAyyspuK2DdNJ54UjVxymFNjf3KVutRasP6q8fYz+FbW5gm09n55T7V76D+8dVeB5I3
         d7fUOSJjTFnIoIGOEMiVnK+5rNKW67cfJ2J/MyDmSyKItiz7/l/HzdtBhKB76BJhICyL
         YPCpChKzn6Kcprqc75SPFCJYVgI+SD8rTZqC4zEZkxKWtlyN/DMaNKdslkYYyuNawkCj
         MCvF2TY0/fqHd1vaezWTW0tXJRnX9srfJ2rDSV0aIVdYBRIs9oH+TC1avIkVivo2ypaX
         SWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793929663; x=1794534463;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APwff/4lOA6lQf98tIGJwKSeLdMqiBGJL1c6dl82img=;
        b=zj3KYST63paozRGToc9Xn4QomKhwxiyIffIyruXVHbP9FmRJCy2kQLy2sceau6lqPE
         pY8Wvheg7x3p2Y2wBa1ZM+r75+nfh4bxfncSNkUG5lklBeybIu3u8DC/Rci76KsET6dZ
         +LA2kwtGCOuvatNudR7cgokTyKtqxsDC9JvFKdClaJiDlq/6F0qORhCvGMBrgXqdxcbD
         pIeGtTGutENlJZI++2J3vrMktyXTNpYYnMl9WUTby4Wn1rNOC3umNKTCScbiGF+rLCw5
         UQtiw5vTPjwbd9LmjLneHQswXqp29zARErepnGxmgLtDuaXfj8pS4SiwWLXld4o4hOMA
         viJg==
X-Forwarded-Encrypted: i=1; AKwUvByNeDqYtPYUd0EhcEaGDavEh6V47Hxxczhla1Se7uJU+ZY0QMazsDZEttj3Ozw6lnLe8Mp/u9M=@lists.infradead.org
X-Gm-Message-State: APuU4Z+mZ7fTk16wiHF+SuUmKMUD/wUcouLAynEd95H0c10DO6YLnI0i
	q5brkN+n7s1hQjGQCt/UbXfKuj0karb07kTISF9qGrEViH/XTj8NMK11wHAYG+oDCR3EWKXWEiO
	Ceg8nrNEbQhOUSJ1fO5pSpQYbrK1IjtsR60JMSw7/EVPyc2eYlQTcBxp1GG+PLKs2
X-Gm-Gg: AYBFou0g4GKYzrBAzFRtVOrK3tlCp7QC0OrCrWbM4+wtVNKhO5oQrTFd/0zUwk94GPn
	0ydYJj5WKbhsLkuM117b5CRJ8Ea9/uS0jwLC5czA0+p/nrLb7SadAPRelMll9oNcDXkUAPxwdWg
	CHw2RdX2AxWIX9E/ZH27jzQXK8TTVilMBdEmFCbU/7PjT6Q4wGNAl0wNYqQFadOdA7KTqqfktNl
	sAGatdAoj20FKjuPWs2ET2v1vJx9jXUsU1NKlYbBlUKXUjwpLSRqBVe2aXFXW30C4y5v+msIuKA
	Ba9leWocjhU3FOSniXtSwN7bg92/b5fXCVUtyKSk891fW9EuJM2BU6TWsxYvKZXlYIgsIjI1ud6
	Q6zngE2xh6LqF8KhHgcA6/11ByDXn9I3TCLgmx6PUJqpXSyAjiQc8qsk0a99NbyMrHT6mqCxPUp
	7Een9UZDIEvbVAT4GYyTnIBh3v0n9vkA==
X-Received: by 2002:a05:693c:8945:10b0:358:c5c9:2661 with SMTP id 5a478bee46e88-36f77edb6b5mr1197449eec.10.1793929663124;
        Thu, 05 Nov 2026 17:47:43 -0800 (PST)
X-Received: by 2002:a05:693c:8945:10b0:358:c5c9:2661 with SMTP id 5a478bee46e88-36f77edb6b5mr1197415eec.10.1793929662450;
        Thu, 05 Nov 2026 17:47:42 -0800 (PST)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fc92fasm1488703eec.19.2026.11.05.17.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 17:47:41 -0800 (PST)
Message-ID: <b879a6b0-4ca3-4937-8bb0-ee3586d60c1b@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 17:47:40 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath10k: don't arm the scan timeout for a scan
 that did not start
To: Christopher Griffin <christophergriffin05@gmail.com>,
        loic.poulain@oss.qualcomm.com
Cc: jjohnson@kernel.org, kvalo@kernel.org, quic_haric@quicinc.com,
        quic_vnaralas@quicinc.com, quic_pradeepc@quicinc.com,
        quic_akolli@quicinc.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        quic_mkenna@quicinc.com, john@phrozen.org, quic_gsamin@quicinc.com,
        ath10k@lists.infradead.org, quic_wgong@quicinc.com
References: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com>
 <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
 <CAFEp6-0O=cPYKndr9hen1jvX==ot2WP4JpGfNFLokVvxUEbxiw@mail.gmail.com>
 <CAKobHXCMwjAHJOkibPbpDByLZmAKkszZ3WaG6soSDaCEGRQjgA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAKobHXCMwjAHJOkibPbpDByLZmAKkszZ3WaG6soSDaCEGRQjgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PRAFkMLJqZ-0JS4wXTXP3fDW4GIlSCT3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAwNiBTYWx0ZWRfX1qDBE88UuoI7
 b57Jy5s3Du2uOhFZQ3IBcCUltlELo689JUn264dtDDXqcji023V2HxUwLzv9fURG+B4yLI4qwHl
 3N/nV+L1UXrdc8w9oGpkNk9JPvAq4rCHl1NOER0fO08Yk5VRh9QGZ899HN5Z9+vMAWOrdIPur/y
 fUweMS8X8q8+ZwQXsmEq5TxXSOQiFL6+KWFoiM3NcV49ojZ+9OSH7IeKzmfJxgds13v8dRu3YvF
 x86jxDDSrYWQYoRgb42k+R4EAEQ6Tb5N828ntLgq6k74LJ5yNi2F9RK+eUaEydLPyyNjd5cKWQA
 g1QG6fBeCMEANj8Ydf6XtwxnP71+TE03EfmlCKobSb1SUxavZZx2p6bZzJ7MRqDLu93fHX+BPRf
 8YY2LBvHTmWyv26711It7Ot3K2lb/AjZMGdW4Fy+1YY1yYss2owwldy5Cjb67yHflWdmt7WLAH9
 nCptcicC46wKO5Puedg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAwNiBTYWx0ZWRfXy4+SEKTCGadB
 RH80mcKxU/Dw/DFoK4YwLej2wFs67fIqoYpQ6ds7OsHfeqn2PkNmFBeqSoyMx/Cy/ZqvXLuNxYN
 TrIsF06Lsgq9oRLyroE7m8FoiQaT5qk=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed31c0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=vn0ihEsipxsDDuCNlwwA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: PRAFkMLJqZ-0JS4wXTXP3fDW4GIlSCT3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_174744_512228_0067061C 
X-CRM114-Status: GOOD (  18.57  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/2026 5:09 PM, Christopher Griffin wrote:
> On Thu, Nov 5, 2026 at 9:53 PM Loic Poulain <loic.poulain@oss.qualcomm.com
> <mailto:loic.poulain@oss.qualcomm.com>> wrote:
>> It looks more like a theoretical issue than something that is likely
>> to occur in practice, but the fix looks good to me.
>>
>> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com
> <mailto:loic.poulain@oss.qualcomm.com>>
> 
> Thanks for the review, Loic.
> 
> We did hit it on ath11k, and it did damage: on a QCN9074, a firmware
> crash failed a scan start with -110, the timeout was armed anyway, and
> it fired after the dead radio had been unbound, ending in "cannot queue
> ath11k_scan_timeout_work on wq" with a garbage workqueue, and a panic
> (that is patch 2/3).
> 
> Whether ath10k ever hits it I don't know, but the code is the same, so
> the fix can't hurt.
> 
> Christopher Griffin

Please don't send HTML e-mail.

Note your reply was not archived or sent to the mailing list because it was
HTML. I only received it since I was directly addressed.

You can see it is not captured in the thread:
https://lore.kernel.org/all/20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com/

/jeff

