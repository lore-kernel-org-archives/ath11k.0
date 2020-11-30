Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjm7t-00031R-7w
 for ath11k@lists.infradead.org; Mon, 30 Nov 2020 16:34:10 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: ath11k-qca6390-bringup-202011301608: better suspend and smaller fixes
Date: Mon, 30 Nov 2020 18:34:00 +0200
Message-ID: <874kl6kdmv.fsf@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

(Bcc: people reporting qca6390 problems)

Hi,

there are updates in ath11k-qca6390-bringup branch[1] and the new tag
is:

ath11k-qca6390-bringup-202011301608

Now we have more reliable suspend and fixes to PCI handling.
Unfortunately still no solution to the kernel crashes people are
experiencing.

All feedback very welcome, both positive and negative. In the reports
try to include at least:

* name of the tag

* if there are other changes in the kernel, reverts etc

* make and model of the laptop/computer (eg. Dell XPS 9310)

Kalle

[1] https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=ath11k-qca6390-bringup

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
