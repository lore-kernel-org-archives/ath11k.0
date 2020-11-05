Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaeKz-0000o7-3M
 for ath11k@lists.infradead.org; Thu, 05 Nov 2020 12:25:58 +0000
MIME-Version: 1.0
Date: Thu, 05 Nov 2020 17:55:49 +0530
From: Sriram R <srirrama@codeaurora.org>
Subject: Re: ath11k: Country code setting ignored on bootup
In-Reply-To: <1657154.X513TT2pbd@ripper>
References: <1829665.1PRlr7bOQj@ripper>
 <BYAPR02MB41208890EFBE3E186114FBC1F7EF0@BYAPR02MB4120.namprd02.prod.outlook.com>
 <43403436f6d704fa510cb290872b794a@codeaurora.org>
 <1657154.X513TT2pbd@ripper>
Message-ID: <2fb984817cc1255b9686a9aa8f16c75b@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, sw@simonwunderlich.de

On 2020-11-04 22:00, Sven Eckelmann wrote:
> On Wednesday, 4 November 2020 17:25:53 CET Sriram R wrote:
>> btw, i dont see any possible issues in current usage of
>> ATH11k_FLAG_REGISTERED in
>>   ath11k_debug_pdev_create, ath11k_mac_register and 
>> ath11k_mac_allocate
>> since they sequenced and fall within the same context. Do you face any
>> issues?
> 
> A firmware crash before ATH11K_QMI_EVENT_FW_READY was 
> processed/received. So
> we might want to recreate the mac/debugfs/... even when it was already 
> created
> - at least this is the stuff mentioned in the commit(s) which introduce 
> the
> ATH11k_FLAG_REGISTERED in these positions.
Yeah right, i think it was added to avoid multiple driver registration.
The ATH11K_FLAG_REGISTERED currently implies core registration complete 
where
mac registration is one part of it. Agree that checking this flag in reg 
path
is not the right approach to decide if mac is registered and default 
rules are
applied for it.
I can also prepare a patch to avoid the issue you had mentioned and a
similar race as below (which i noted with this patch in my setup)and
see if it works fine for all use cases.
Please note below on the 4th line, the Default regd for pdev 0 gets
overwritten from US to IN(the country set before ath11k bind), which is 
not desirable.

[  949.056244] ath11k c000000.wifi1: Default REGD update pdev 0 US
[  949.056493] ath11k c000000.wifi1: Default REGD update pdev 1 US
[  949.056595] ath11k c000000.wifi1: Default REGD update pdev 2 US
[  949.061231] ath11k c000000.wifi1: Default REGD update pdev 0 IN
[  949.063915] ath11k c000000.wifi1: User REGD update pdev 1 IN
[  949.066156] ath11k c000000.wifi1: User REGD update pdev 2 IN

Thanks and Regards,
Sriram.R
> 
> Kind regards,
> 	Sven

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
